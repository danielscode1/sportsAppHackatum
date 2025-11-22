import '../../../common/models/amenity_model.dart';

/// Example file showing how to add amenities
/// 
/// Copy the examples below to amenities_data.dart

class AmenitiesDataExample {
  // Example: Public toilets
  static final List<AmenityModel> toiletsExample = [
    AmenityModel.fromCoordinates(
      id: 'toilet_1',
      type: AmenityType.toilet,
      lat: 48.1351,  // Replace with your GPS latitude
      lng: 11.5820,  // Replace with your GPS longitude
      name: 'Public Toilet - Marienplatz',
      description: 'Located near the main square',
    ),
    AmenityModel.fromCoordinates(
      id: 'toilet_2',
      type: AmenityType.toilet,
      lat: 48.1374,
      lng: 11.5755,
      name: 'Public Toilet - English Garden',
    ),
  ];

  // Example: Drinkable water supplies
  static final List<AmenityModel> waterSuppliesExample = [
    AmenityModel.fromCoordinates(
      id: 'water_1',
      type: AmenityType.waterSupply,
      lat: 48.1351,  // Replace with your GPS latitude
      lng: 11.5820,  // Replace with your GPS longitude
      name: 'Drinking Fountain - Marienplatz',
      description: 'Public drinking water fountain',
    ),
    AmenityModel.fromCoordinates(
      id: 'water_2',
      type: AmenityType.waterSupply,
      lat: 48.1374,
      lng: 11.5755,
      name: 'Water Station - English Garden',
    ),
  ];

  // Example GeoJSON format (if you prefer to use GeoJSON):
  // 
  // {
  //   "type": "FeatureCollection",
  //   "features": [
  //     {
  //       "type": "Feature",
  //       "id": "toilet_1",
  //       "geometry": {
  //         "type": "Point",
  //         "coordinates": [11.5820, 48.1351]  // Note: [longitude, latitude]
  //       },
  //       "properties": {
  //         "type": "toilet",
  //         "name": "Public Toilet - Marienplatz",
  //         "description": "Located near the main square"
  //       }
  //     },
  //     {
  //       "type": "Feature",
  //       "id": "water_1",
  //       "geometry": {
  //         "type": "Point",
  //         "coordinates": [11.5820, 48.1351]
  //       },
  //       "properties": {
  //         "type": "waterSupply",
  //         "name": "Drinking Fountain - Marienplatz"
  //       }
  //     }
  //   ]
  // }
  //
  // To load from GeoJSON, you would do:
  // final geoJsonData = jsonDecode(await rootBundle.loadString('assets/amenities.geojson'));
  // final amenities = AmenitiesData.fromGeoJSON(geoJsonData);
}

