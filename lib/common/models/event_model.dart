import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String hostId;
  final String title;
  final String sportType;
  final String description;
  final String note;
  final DateTime datetime; // Keep for backward compatibility (start time)
  final DateTime startTime;
  final DateTime endTime;
  final int capacity;
  final double lat;
  final double lng;
  final DateTime createdAt;
  final int estimatedBusyness;
  final bool isInviteOnly;
  final List<String> imageUrls;

  EventModel({
    required this.id,
    required this.hostId,
    required this.title,
    required this.sportType,
    required this.description,
    required this.note,
    required this.datetime,
    required this.startTime,
    required this.endTime,
    required this.capacity,
    required this.lat,
    required this.lng,
    required this.createdAt,
    this.estimatedBusyness = 0,
    this.isInviteOnly = false,
    this.imageUrls = const [],
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
      startTime: data['startTime'] != null
          ? (data['startTime'] as Timestamp).toDate()
          : (data['datetime'] as Timestamp).toDate(),
      endTime: data['endTime'] != null
          ? (data['endTime'] as Timestamp).toDate()
          : (data['datetime'] as Timestamp).toDate().add(const Duration(hours: 1)),
      capacity: data['capacity'] as int,
      lat: coords['lat'] as double,
      lng: coords['lng'] as double,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      estimatedBusyness: data['estimatedBusyness'] as int? ?? 0,
      isInviteOnly: data['isInviteOnly'] as bool? ?? false,
      imageUrls: data['imageUrls'] != null
          ? List<String>.from(data['imageUrls'] as List)
          : [],
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
      'startTime': Timestamp.fromDate(startTime),
      'endTime': Timestamp.fromDate(endTime),
      'capacity': capacity,
      'coordinates': {
        'lat': lat,
        'lng': lng,
      },
      'createdAt': Timestamp.fromDate(createdAt),
      'estimatedBusyness': estimatedBusyness,
      'isInviteOnly': isInviteOnly,
      'imageUrls': imageUrls,
    };
  }

  EventModel copyWith({
    String? id,
    String? hostId,
    String? title,
    String? sportType,
    String? description,
    String? note,
    DateTime? datetime,
    DateTime? startTime,
    DateTime? endTime,
    int? capacity,
    double? lat,
    double? lng,
    DateTime? createdAt,
    int? estimatedBusyness,
    bool? isInviteOnly,
    List<String>? imageUrls,
  }) {
    return EventModel(
      id: id ?? this.id,
      hostId: hostId ?? this.hostId,
      title: title ?? this.title,
      sportType: sportType ?? this.sportType,
      description: description ?? this.description,
      note: note ?? this.note,
      datetime: datetime ?? this.datetime,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      capacity: capacity ?? this.capacity,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      createdAt: createdAt ?? this.createdAt,
      estimatedBusyness: estimatedBusyness ?? this.estimatedBusyness,
      isInviteOnly: isInviteOnly ?? this.isInviteOnly,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}

