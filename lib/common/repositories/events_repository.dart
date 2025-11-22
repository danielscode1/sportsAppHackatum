import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../models/event_model.dart';
import 'dart:math';

class EventsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Stream<List<EventModel>> getEventsStream() {
    final now = Timestamp.now();
    return _firestore
        .collection('events')
        .where('endTime', isGreaterThan: now) // Only show events that haven't ended
        .orderBy('endTime')
        .snapshots()
        .map((snapshot) {
          // Filter out events that have ended (in case endTime field is missing)
          return snapshot.docs
              .map((doc) => EventModel.fromFirestore(doc))
              .where((event) => event.endTime.isAfter(DateTime.now()))
              .toList();
        });
  }

  Future<String> createEvent(EventModel event) async {
    final docRef = await _firestore.collection('events').add(event.toFirestore());
    
    // Add host as attendee
    await _firestore
        .collection('events')
        .doc(docRef.id)
        .collection('attendees')
        .doc(event.hostId)
        .set({
      'joinedAt': Timestamp.now(),
    });

    return docRef.id;
  }

  Future<void> updateEvent(EventModel event) async {
    await _firestore
        .collection('events')
        .doc(event.id)
        .update(event.toFirestore());
  }

  Future<String> uploadEventImage(String eventId, XFile imageFile, int index) async {
    try {
      final ref = _firebaseStorage
          .ref()
          .child('event_images')
          .child(eventId)
          .child('$index.jpg');
      
      UploadTask uploadTask;
      
      if (kIsWeb) {
        // For web, read bytes from XFile and add metadata
        final bytes = await imageFile.readAsBytes();
        if (bytes.isEmpty) {
          throw Exception('Image file is empty');
        }
        final metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'uploadedBy': 'user'},
        );
        uploadTask = ref.putData(bytes, metadata);
      } else {
        // For mobile, use File with metadata
        final file = File(imageFile.path);
        if (!await file.exists()) {
          throw Exception('Image file does not exist');
        }
        final metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'uploadedBy': 'user'},
        );
        uploadTask = ref.putFile(file, metadata);
      }
      
      // Wait for upload to complete
      final snapshot = await uploadTask;
      
      // Get download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: ${e.toString()}');
    }
  }

  Future<void> joinEvent(String eventId, String userId) async {
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .doc(userId)
        .set({
      'joinedAt': Timestamp.now(),
    });
  }

  Future<void> leaveEvent(String eventId, String userId) async {
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .doc(userId)
        .delete();
    
    // Check if event should be auto-deleted (last member is creator)
    final eventDoc = await _firestore.collection('events').doc(eventId).get();
    if (eventDoc.exists) {
      final eventData = eventDoc.data()!;
      final hostId = eventData['hostId'] as String;
      
      // Get remaining attendees
      final attendeesSnapshot = await _firestore
          .collection('events')
          .doc(eventId)
          .collection('attendees')
          .get();
      
      // If no one remains, or host leaves, delete event
      if (attendeesSnapshot.docs.isEmpty || userId == hostId) {
        await deleteEvent(eventId);
      }
    }
  }

  Future<void> removeAttendee(String eventId, String userId) async {
    // Only allow host to remove attendees (enforced by Firestore rules)
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .doc(userId)
        .delete();
  }

  Future<void> deleteEvent(String eventId) async {
    // Delete all subcollections first
    final batch = _firestore.batch();
    
    // Delete attendees
    final attendees = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .get();
    for (final doc in attendees.docs) {
      batch.delete(doc.reference);
    }
    
    // Delete requests
    final requests = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('requests')
        .get();
    for (final doc in requests.docs) {
      batch.delete(doc.reference);
    }
    
    // Delete chat messages
    final chatMessages = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('chat')
        .get();
    for (final doc in chatMessages.docs) {
      batch.delete(doc.reference);
    }
    
    // Delete event document
    batch.delete(_firestore.collection('events').doc(eventId));
    
    await batch.commit();
  }

  Future<void> requestToJoin(String eventId, String userId) async {
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('requests')
        .doc(userId)
        .set({
      'requestedAt': Timestamp.now(),
    });
  }

  Future<void> approveRequest(String eventId, String userId) async {
    // Remove from requests
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('requests')
        .doc(userId)
        .delete();
    
    // Add to attendees
    await joinEvent(eventId, userId);
  }

  // Alias for approveRequest
  Future<void> acceptRequest(String eventId, String userId) async {
    await approveRequest(eventId, userId);
  }

  Future<void> rejectRequest(String eventId, String userId) async {
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('requests')
        .doc(userId)
        .delete();
  }

  Future<bool> hasRequested(String eventId, String userId) async {
    final doc = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('requests')
        .doc(userId)
        .get();
    return doc.exists;
  }

  Stream<List<String>> getEventRequests(String eventId) {
    return _firestore
        .collection('events')
        .doc(eventId)
        .collection('requests')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }

  Stream<List<String>> getEventAttendees(String eventId) {
    return _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }

  Stream<int> getAttendeeCount(String eventId) {
    return _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  Future<bool> isUserAttending(String eventId, String userId) async {
    final doc = await _firestore
        .collection('events')
        .doc(eventId)
        .collection('attendees')
        .doc(userId)
        .get();
    return doc.exists;
  }

  Stream<List<String>> getUserJoinedEvents(String userId) {
    return _firestore
        .collectionGroup('attendees')
        .where(FieldPath.documentId, isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => doc.reference.parent.parent!.id)
            .toList());
  }

  Future<EventModel?> getEventById(String eventId) async {
    final doc = await _firestore.collection('events').doc(eventId).get();
    if (!doc.exists) return null;
    return EventModel.fromFirestore(doc);
  }

  Future<List<EventModel>> getPastEvents(String userId) async {
    final now = Timestamp.now();
    
    // Get events where user is host
    final hostEvents = await _firestore
        .collection('events')
        .where('hostId', isEqualTo: userId)
        .where('datetime', isLessThan: now)
        .get();

    // Get events where user is attendee
    final attendeeDocs = await _firestore
        .collectionGroup('attendees')
        .where(FieldPath.documentId, isEqualTo: userId)
        .get();

    final eventIds = attendeeDocs.docs
        .map((doc) => doc.reference.parent.parent!.id)
        .toSet();

    final attendeeEvents = <EventModel>[];
    for (final eventId in eventIds) {
      final eventDoc = await _firestore.collection('events').doc(eventId).get();
      if (eventDoc.exists) {
        final event = EventModel.fromFirestore(eventDoc);
        if (event.datetime.isBefore(DateTime.now())) {
          attendeeEvents.add(event);
        }
      }
    }

    final allEvents = [
      ...hostEvents.docs.map((doc) => EventModel.fromFirestore(doc)),
      ...attendeeEvents,
    ];

    // Remove duplicates
    final uniqueEvents = <String, EventModel>{};
    for (final event in allEvents) {
      uniqueEvents[event.id] = event;
    }

    return uniqueEvents.values.toList()
      ..sort((a, b) => b.datetime.compareTo(a.datetime));
  }
}

