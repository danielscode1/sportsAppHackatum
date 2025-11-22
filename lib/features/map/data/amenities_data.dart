import '../../../common/models/amenity_model.dart';

/// Amenities data file
/// 
/// You can add your GPS coordinates here in two ways:
/// 
/// 1. Simple coordinates (recommended for small datasets):
///    Add entries to the lists below using AmenityModel.fromCoordinates()
/// 
/// 2. GeoJSON format (recommended for large datasets):
///    Create a GeoJSON file and load it using the fromGeoJSON factory
/// 
/// Example GeoJSON format:
/// {
///   "type": "FeatureCollection",
///   "features": [
///     {
///       "type": "Feature",
///       "geometry": {
///         "type": "Point",
///         "coordinates": [11.5820, 48.1351]
///       },
///       "properties": {
///         "type": "toilet",
///         "name": "Public Toilet",
///         "description": "Near park entrance"
///       }
///     }
///   ]
/// }

class AmenitiesData {
  // Public toilets in Munich area
  static final List<AmenityModel> toilets = [
    AmenityModel.fromCoordinates(
      id: 'toilet_1',
      type: AmenityType.toilet,
      lat: 48.1374,
      lng: 11.5755,
      name: 'Public Toilet - Marienplatz',
      description: 'Located near the main square',
    ),
    AmenityModel.fromCoordinates(
      id: 'toilet_2',
      type: AmenityType.toilet,
      lat: 48.1319,
      lng: 11.5852,
      name: 'Public Toilet - English Garden',
      description: 'Near the Chinese Tower',
    ),
    AmenityModel.fromCoordinates(
      id: 'toilet_3',
      type: AmenityType.toilet,
      lat: 48.1406,
      lng: 11.5684,
      name: 'Public Toilet - Odeonsplatz',
    ),
  ];

  // Drinkable water supply locations in Munich area
  static final List<AmenityModel> waterSupplies = [
    AmenityModel.fromCoordinates(
      id: 'water_1',
      type: AmenityType.waterSupply,
      lat: 48.1351,
      lng: 11.5820,
      name: 'Drinking Fountain - Marienplatz',
      description: 'Public drinking water fountain',
    ),
    AmenityModel.fromCoordinates(
      id: 'water_2',
      type: AmenityType.waterSupply,
      lat: 48.1319,
      lng: 11.5852,
      name: 'Water Station - English Garden',
      description: 'Near the beer garden',
    ),
    AmenityModel.fromCoordinates(
      id: 'water_3',
      type: AmenityType.waterSupply,
      lat: 48.1432,
      lng: 11.5701,
      name: 'Drinking Fountain - Hofgarten',
    ),
  ];

  // Sport areas (volleyball fields, basketball courts, etc.)
  static final List<AmenityModel> sportAreas = [
    AmenityModel.fromCoordinates(
      id: 'sport_1',
      type: AmenityType.sportArea,
      lat: 48.1319,
      lng: 11.5852,
      name: 'Volleyball Court - English Garden',
      description: 'Public volleyball field',
    ),
    AmenityModel.fromCoordinates(
      id: 'sport_2',
      type: AmenityType.sportArea,
      lat: 48.1432,
      lng: 11.5701,
      name: 'Basketball Court - Hofgarten',
      description: 'Outdoor basketball court',
    ),
    AmenityModel.fromCoordinates(
      id: 'sport_3',
      type: AmenityType.sportArea,
      lat: 48.1374,
      lng: 11.5755,
      name: 'Football Field - Marienplatz Area',
      description: 'Public football/soccer field',
    ),
  ];

  // Combined list of all amenities
  static List<AmenityModel> get allAmenities => [
    ...toilets,
    ...waterSupplies,
    ...sportAreas,
  ];

  // Load from GeoJSON FeatureCollection
  static List<AmenityModel> fromGeoJSON(Map<String, dynamic> geoJson) {
    final features = geoJson['features'] as List<dynamic>? ?? [];
    return features
        .map((feature) => AmenityModel.fromGeoJSON(feature as Map<String, dynamic>))
        .toList();
  }
}

