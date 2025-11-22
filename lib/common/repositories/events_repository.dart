import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class EventsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<EventModel>> getEventsStream() {
    return _firestore
        .collection('events')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => EventModel.fromFirestore(doc))
            .toList());
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

