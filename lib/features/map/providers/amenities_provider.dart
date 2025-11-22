import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/amenities_data.dart';
import '../../../common/models/amenity_model.dart';

/// Provider for amenities data
final amenitiesProvider = Provider<List<AmenityModel>>((ref) {
  return AmenitiesData.allAmenities;
});

