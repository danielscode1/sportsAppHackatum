import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String hostId;
  final String title;
  final String sportType;
  final String description;
  final String note;
  final DateTime datetime;
  final int capacity;
  final double lat;
  final double lng;
  final DateTime createdAt;
  final int estimatedBusyness;

  EventModel({
    required this.id,
    required this.hostId,
    required this.title,
    required this.sportType,
    required this.description,
    required this.note,
    required this.datetime,
    required this.capacity,
    required this.lat,
    required this.lng,
    required this.createdAt,
    this.estimatedBusyness = 0,
  });

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final coords = data['coordinates'] as Map<String, dynamic>;
    return EventModel(
      id: doc.id,
      hostId: data['hostId'] as String,
      title: data['title'] as String,
      sportType: data['sportType'] as String,
      description: data['description'] as String,
      note: data['note'] as String,
      datetime: (data['datetime'] as Timestamp).toDate(),
      capacity: data['capacity'] as int,
      lat: coords['lat'] as double,
      lng: coords['lng'] as double,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      estimatedBusyness: data['estimatedBusyness'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'hostId': hostId,
      'title': title,
      'sportType': sportType,
      'description': description,
      'note': note,
      'datetime': Timestamp.fromDate(datetime),
      'capacity': capacity,
      'coordinates': {
        'lat': lat,
        'lng': lng,
      },
      'createdAt': Timestamp.fromDate(createdAt),
      'estimatedBusyness': estimatedBusyness,
    };
  }
}

