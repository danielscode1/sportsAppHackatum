import 'package:latlong2/latlong.dart';

enum AmenityType {
  toilet,
  waterSupply,
  sportArea,
}

class AmenityModel {
  final String id;
  final AmenityType type;
  final LatLng location;
  final String? name;
  final String? description;

  AmenityModel({
    required this.id,
    required this.type,
    required this.location,
    this.name,
    this.description,
  });

  // Factory constructor from simple coordinates
  factory AmenityModel.fromCoordinates({
    required String id,
    required AmenityType type,
    required double lat,
    required double lng,
    String? name,
    String? description,
  }) {
    return AmenityModel(
      id: id,
      type: type,
      location: LatLng(lat, lng),
      name: name,
      description: description,
    );
  }

  // Factory constructor from GeoJSON Feature
  factory AmenityModel.fromGeoJSON(Map<String, dynamic> feature) {
    final geometry = feature['geometry'] as Map<String, dynamic>;
    final properties = feature['properties'] as Map<String, dynamic>? ?? {};
    final coordinates = geometry['coordinates'] as List<dynamic>;
    
    // GeoJSON coordinates are [longitude, latitude]
    final lng = (coordinates[0] as num).toDouble();
    final lat = (coordinates[1] as num).toDouble();
    
    final typeString = properties['type'] as String? ?? '';
    final amenityType = switch (typeString.toLowerCase()) {
      'toilet' => AmenityType.toilet,
      'watersupply' => AmenityType.waterSupply,
      'sportarea' => AmenityType.sportArea,
      _ => AmenityType.toilet, // default
    };
    
    return AmenityModel(
      id: properties['id'] as String? ?? feature['id'] as String? ?? '',
      type: amenityType,
      location: LatLng(lat, lng),
      name: properties['name'] as String?,
      description: properties['description'] as String?,
    );
  }

  // Convert to GeoJSON Feature
  Map<String, dynamic> toGeoJSON() {
    return {
      'type': 'Feature',
      'id': id,
      'geometry': {
        'type': 'Point',
        'coordinates': [location.longitude, location.latitude],
      },
      'properties': {
        'type': switch (type) {
          AmenityType.toilet => 'toilet',
          AmenityType.waterSupply => 'waterSupply',
          AmenityType.sportArea => 'sportArea',
        },
        'name': name,
        'description': description,
      },
    };
  }
}

