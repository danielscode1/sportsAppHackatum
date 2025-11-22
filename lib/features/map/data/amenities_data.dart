import '../../../common/models/amenity_model.dart';

/// Amenities data file
/// 
/// Add your GPS coordinates here using AmenityModel.fromCoordinates()
/// 
/// You can also use GeoJSON format (for large datasets):
/// Create a GeoJSON file and load it using the fromGeoJSON factory
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
  static final List<AmenityModel> manualToilets = [
    // AmenityModel.fromCoordinates(
    //   id: 'toilet_1',
    //   type: AmenityType.toilet,
    //   lat: 48.1374,
    //   lng: 11.5755,
    //   name: 'Public Toilet - Marienplatz',
    //   description: 'Located near the main square',
    // ),
    // AmenityModel.fromCoordinates(
    //   id: 'toilet_2',
    //   type: AmenityType.toilet,
    //   lat: 48.1319,
    //   lng: 11.5852,
    //   name: 'Public Toilet - English Garden',
    //   description: 'Near the Chinese Tower',
    // ),
    // AmenityModel.fromCoordinates(
    //   id: 'toilet_3',
    //   type: AmenityType.toilet,
    //   lat: 48.1406,
    //   lng: 11.5684,
    //   name: 'Public Toilet - Odeonsplatz',
    // ),
    
    AmenityModel.fromCoordinates(
  id: 'toilet_2',
  type: AmenityType.toilet,
  lat: 48.1387825,
  lng: 11.4733286,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_3',
  type: AmenityType.toilet,
  lat: 48.1439894,
  lng: 11.5509172,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_4',
  type: AmenityType.toilet,
  lat: 48.0914112,
  lng: 11.5453183,
  name: 'Waschhaus',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_5',
  type: AmenityType.toilet,
  lat: 48.1688317,
  lng: 11.52939,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_6',
  type: AmenityType.toilet,
  lat: 48.2005884,
  lng: 11.4209165,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_7',
  type: AmenityType.toilet,
  lat: 48.1672036,
  lng: 11.5278549,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_8',
  type: AmenityType.toilet,
  lat: 48.1654978,
  lng: 11.528425,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_9',
  type: AmenityType.toilet,
  lat: 48.1257207,
  lng: 11.5269795,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_10',
  type: AmenityType.toilet,
  lat: 48.1458859,
  lng: 11.623079,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_11',
  type: AmenityType.toilet,
  lat: 48.1621937,
  lng: 11.5004512,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_12',
  type: AmenityType.toilet,
  lat: 48.1478756,
  lng: 11.5083912,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_13',
  type: AmenityType.toilet,
  lat: 48.1147534,
  lng: 11.638431,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_14',
  type: AmenityType.toilet,
  lat: 48.1818258,
  lng: 11.5289232,
  name: 'Münchner Stadtbibliothek Moosach',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_15',
  type: AmenityType.toilet,
  lat: 48.0680794,
  lng: 11.5131846,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_16',
  type: AmenityType.toilet,
  lat: 48.1773897,
  lng: 11.5799741,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_17',
  type: AmenityType.toilet,
  lat: 48.1946228,
  lng: 11.5354931,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_18',
  type: AmenityType.toilet,
  lat: 48.1279681,
  lng: 11.6029143,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_19',
  type: AmenityType.toilet,
  lat: 48.2168165,
  lng: 11.5147042,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_20',
  type: AmenityType.toilet,
  lat: 48.2026764,
  lng: 11.4192366,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_21',
  type: AmenityType.toilet,
  lat: 48.1288378,
  lng: 11.5934766,
  name: 'Public Toilet',
  description: 'WC',
),

AmenityModel.fromCoordinates(
  id: 'toilet_22',
  type: AmenityType.toilet,
  lat: 48.1707457,
  lng: 11.5725531,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_23',
  type: AmenityType.toilet,
  lat: 48.1349113,
  lng: 11.5820498,
  name: 'Public Toilet',
  description: 'Öffentliche Toiletten, inzwischen mit Gebühr',
),

AmenityModel.fromCoordinates(
  id: 'toilet_24',
  type: AmenityType.toilet,
  lat: 48.1521909,
  lng: 11.5931638,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_25',
  type: AmenityType.toilet,
  lat: 48.1423757,
  lng: 11.5491173,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_26',
  type: AmenityType.toilet,
  lat: 48.1960006,
  lng: 11.4558602,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_27',
  type: AmenityType.toilet,
  lat: 48.2025106,
  lng: 11.5258834,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_28',
  type: AmenityType.toilet,
  lat: 48.1121878,
  lng: 11.6426683,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_29',
  type: AmenityType.toilet,
  lat: 48.1993782,
  lng: 11.5361477,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_30',
  type: AmenityType.toilet,
  lat: 48.2062684,
  lng: 11.528109,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_31',
  type: AmenityType.toilet,
  lat: 48.134197,
  lng: 11.5676349,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_32',
  type: AmenityType.toilet,
  lat: 48.1161584,
  lng: 11.6338947,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_33',
  type: AmenityType.toilet,
  lat: 48.1839827,
  lng: 11.6077135,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_34',
  type: AmenityType.toilet,
  lat: 48.1505105,
  lng: 11.4619099,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_35',
  type: AmenityType.toilet,
  lat: 48.1122383,
  lng: 11.5610381,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_36',
  type: AmenityType.toilet,
  lat: 48.1025057,
  lng: 11.5522793,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_37',
  type: AmenityType.toilet,
  lat: 48.1369025,
  lng: 11.5762332,
  name: 'Toilette für alle',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_38',
  type: AmenityType.toilet,
  lat: 48.1720244,
  lng: 11.5676941,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_39',
  type: AmenityType.toilet,
  lat: 48.1334499,
  lng: 11.6921212,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_40',
  type: AmenityType.toilet,
  lat: 48.1484592,
  lng: 11.4639544,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_41',
  type: AmenityType.toilet,
  lat: 48.14773,
  lng: 11.4635782,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_42',
  type: AmenityType.toilet,
  lat: 48.1301294,
  lng: 11.5905201,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_43',
  type: AmenityType.toilet,
  lat: 48.1411409,
  lng: 11.5591103,
  name: 'rail & fresh',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_44',
  type: AmenityType.toilet,
  lat: 48.1613804,
  lng: 11.6511105,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_45',
  type: AmenityType.toilet,
  lat: 48.1695107,
  lng: 11.5897602,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_46',
  type: AmenityType.toilet,
  lat: 48.1396697,
  lng: 11.5587786,
  name: 'Public Toilet',
  description: 'You get a 0.50 EUR credit you can spend on some shops in the station.',
),

AmenityModel.fromCoordinates(
  id: 'toilet_47',
  type: AmenityType.toilet,
  lat: 48.1624676,
  lng: 11.586798,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_48',
  type: AmenityType.toilet,
  lat: 48.1534214,
  lng: 11.6208507,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_49',
  type: AmenityType.toilet,
  lat: 48.1346865,
  lng: 11.6106766,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_50',
  type: AmenityType.toilet,
  lat: 48.1346677,
  lng: 11.6106887,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_51',
  type: AmenityType.toilet,
  lat: 48.1346613,
  lng: 11.6106669,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_52',
  type: AmenityType.toilet,
  lat: 48.1346868,
  lng: 11.6106604,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_53',
  type: AmenityType.toilet,
  lat: 48.1348482,
  lng: 11.6109681,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_54',
  type: AmenityType.toilet,
  lat: 48.1348648,
  lng: 11.6109567,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_55',
  type: AmenityType.toilet,
  lat: 48.1348239,
  lng: 11.6109525,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_56',
  type: AmenityType.toilet,
  lat: 48.1348402,
  lng: 11.6109078,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_57',
  type: AmenityType.toilet,
  lat: 48.1346623,
  lng: 11.6106791,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_58',
  type: AmenityType.toilet,
  lat: 48.1346783,
  lng: 11.6106579,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_59',
  type: AmenityType.toilet,
  lat: 48.1088701,
  lng: 11.4726238,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_60',
  type: AmenityType.toilet,
  lat: 48.1294376,
  lng: 11.5587069,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_61',
  type: AmenityType.toilet,
  lat: 48.1357215,
  lng: 11.5984846,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_62',
  type: AmenityType.toilet,
  lat: 48.1354144,
  lng: 11.5033205,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_63',
  type: AmenityType.toilet,
  lat: 48.1218768,
  lng: 11.5080041,
  name: 'WC am Jackl',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_64',
  type: AmenityType.toilet,
  lat: 48.1218953,
  lng: 11.5081373,
  name: 'WC am Jackl',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_65',
  type: AmenityType.toilet,
  lat: 48.1219376,
  lng: 11.5078834,
  name: 'WC am Jackl',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_66',
  type: AmenityType.toilet,
  lat: 48.1326912,
  lng: 11.67932,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_67',
  type: AmenityType.toilet,
  lat: 48.1266419,
  lng: 11.5774023,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_68',
  type: AmenityType.toilet,
  lat: 48.1236291,
  lng: 11.5716133,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_69',
  type: AmenityType.toilet,
  lat: 48.1216513,
  lng: 11.5680345,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_70',
  type: AmenityType.toilet,
  lat: 48.1583,
  lng: 11.5030868,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_71',
  type: AmenityType.toilet,
  lat: 48.1600747,
  lng: 11.5989657,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_72',
  type: AmenityType.toilet,
  lat: 48.1289865,
  lng: 11.7099927,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_73',
  type: AmenityType.toilet,
  lat: 48.1284938,
  lng: 11.5232921,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_74',
  type: AmenityType.toilet,
  lat: 48.0993822,
  lng: 11.5581196,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_75',
  type: AmenityType.toilet,
  lat: 48.0984313,
  lng: 11.5585614,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_76',
  type: AmenityType.toilet,
  lat: 48.1857486,
  lng: 11.6207605,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_77',
  type: AmenityType.toilet,
  lat: 48.1693072,
  lng: 11.5256425,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_78',
  type: AmenityType.toilet,
  lat: 48.0928277,
  lng: 11.5474521,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_79',
  type: AmenityType.toilet,
  lat: 48.1107614,
  lng: 11.5943801,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_80',
  type: AmenityType.toilet,
  lat: 48.0894238,
  lng: 11.6443022,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_81',
  type: AmenityType.toilet,
  lat: 48.1837639,
  lng: 11.5332217,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_82',
  type: AmenityType.toilet,
  lat: 48.1076122,
  lng: 11.5852071,
  name: 'Public Toilet',
  description: 'Die "Toilette für alle" befindet sich in der öffentlichen WC-Anlage im Weißenseepark und ist mit einem Euro-WC-Schlüssel zugängig. Die "Toilette für alle" ist ausgestattet mit einem Deckenlifter und einer höhenverstellbaren Pflegeliege.',
),

AmenityModel.fromCoordinates(
  id: 'toilet_83',
  type: AmenityType.toilet,
  lat: 48.1447595,
  lng: 11.5224278,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_84',
  type: AmenityType.toilet,
  lat: 48.2001354,
  lng: 11.4144569,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_85',
  type: AmenityType.toilet,
  lat: 48.1496824,
  lng: 11.5850443,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_86',
  type: AmenityType.toilet,
  lat: 48.1393454,
  lng: 11.5660186,
  name: 'shop & fresh WC-Center',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_87',
  type: AmenityType.toilet,
  lat: 48.1288049,
  lng: 11.5935351,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_88',
  type: AmenityType.toilet,
  lat: 48.0947055,
  lng: 11.5521525,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_89',
  type: AmenityType.toilet,
  lat: 48.1317712,
  lng: 11.5171917,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_90',
  type: AmenityType.toilet,
  lat: 48.1229353,
  lng: 11.5086392,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_91',
  type: AmenityType.toilet,
  lat: 48.1497042,
  lng: 11.5101419,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_92',
  type: AmenityType.toilet,
  lat: 48.1498966,
  lng: 11.5115804,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_93',
  type: AmenityType.toilet,
  lat: 48.2212283,
  lng: 11.5497849,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_94',
  type: AmenityType.toilet,
  lat: 48.1699787,
  lng: 11.4483869,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_95',
  type: AmenityType.toilet,
  lat: 48.1365157,
  lng: 11.5346167,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_96',
  type: AmenityType.toilet,
  lat: 48.1038128,
  lng: 11.5126808,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_97',
  type: AmenityType.toilet,
  lat: 48.1222314,
  lng: 11.6287844,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_98',
  type: AmenityType.toilet,
  lat: 48.1340397,
  lng: 11.5384629,
  name: 'Public Toilet',
  description: 'außen angebrachter Trinkwasserhahn im Winter außer Betrieb',
),

AmenityModel.fromCoordinates(
  id: 'toilet_99',
  type: AmenityType.toilet,
  lat: 48.123835,
  lng: 11.5728505,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_100',
  type: AmenityType.toilet,
  lat: 48.1377723,
  lng: 11.4966096,
  name: 'München Valpichlerstraße',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_101',
  type: AmenityType.toilet,
  lat: 48.1491964,
  lng: 11.4606112,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_102',
  type: AmenityType.toilet,
  lat: 48.1168227,
  lng: 11.526273,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_103',
  type: AmenityType.toilet,
  lat: 48.1375573,
  lng: 11.575759,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_104',
  type: AmenityType.toilet,
  lat: 48.1322012,
  lng: 11.5629409,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_105',
  type: AmenityType.toilet,
  lat: 48.1465612,
  lng: 11.4100604,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_106',
  type: AmenityType.toilet,
  lat: 48.1346025,
  lng: 11.577065,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_107',
  type: AmenityType.toilet,
  lat: 48.1247003,
  lng: 11.7053578,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_108',
  type: AmenityType.toilet,
  lat: 48.1004938,
  lng: 11.5522431,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_109',
  type: AmenityType.toilet,
  lat: 48.0907852,
  lng: 11.6590806,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_110',
  type: AmenityType.toilet,
  lat: 48.101519,
  lng: 11.5464054,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_111',
  type: AmenityType.toilet,
  lat: 48.1099844,
  lng: 11.6302643,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_112',
  type: AmenityType.toilet,
  lat: 48.1221227,
  lng: 11.6012692,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_113',
  type: AmenityType.toilet,
  lat: 48.1472898,
  lng: 11.5674858,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_114',
  type: AmenityType.toilet,
  lat: 48.1473049,
  lng: 11.5675343,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_115',
  type: AmenityType.toilet,
  lat: 48.1473432,
  lng: 11.5675257,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_116',
  type: AmenityType.toilet,
  lat: 48.1206218,
  lng: 11.6589723,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_117',
  type: AmenityType.toilet,
  lat: 48.1221795,
  lng: 11.5222366,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_118',
  type: AmenityType.toilet,
  lat: 48.1599371,
  lng: 11.5750619,
  name: 'Hering',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_119',
  type: AmenityType.toilet,
  lat: 48.2089929,
  lng: 11.5732364,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_120',
  type: AmenityType.toilet,
  lat: 48.1166459,
  lng: 11.536378,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_121',
  type: AmenityType.toilet,
  lat: 48.1122849,
  lng: 11.5030274,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_122',
  type: AmenityType.toilet,
  lat: 48.1085695,
  lng: 11.501772,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_123',
  type: AmenityType.toilet,
  lat: 48.1460202,
  lng: 11.6171748,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_124',
  type: AmenityType.toilet,
  lat: 48.1795128,
  lng: 11.5066413,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_125',
  type: AmenityType.toilet,
  lat: 48.1940014,
  lng: 11.4190479,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_126',
  type: AmenityType.toilet,
  lat: 48.1301246,
  lng: 11.5905206,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_127',
  type: AmenityType.toilet,
  lat: 48.128266,
  lng: 11.6046237,
  name: 'Rail & Fresh WC',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_128',
  type: AmenityType.toilet,
  lat: 48.0854652,
  lng: 11.5400338,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_129',
  type: AmenityType.toilet,
  lat: 48.0981342,
  lng: 11.5569891,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_130',
  type: AmenityType.toilet,
  lat: 48.1748604,
  lng: 11.6002054,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_131',
  type: AmenityType.toilet,
  lat: 48.1840874,
  lng: 11.4065103,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_132',
  type: AmenityType.toilet,
  lat: 48.078741,
  lng: 11.5174506,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_133',
  type: AmenityType.toilet,
  lat: 48.1090608,
  lng: 11.561106,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_134',
  type: AmenityType.toilet,
  lat: 48.1116463,
  lng: 11.5591639,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_135',
  type: AmenityType.toilet,
  lat: 48.1190808,
  lng: 11.5770926,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_136',
  type: AmenityType.toilet,
  lat: 48.1284082,
  lng: 11.5756413,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_137',
  type: AmenityType.toilet,
  lat: 48.1181798,
  lng: 11.588004,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_138',
  type: AmenityType.toilet,
  lat: 48.1742569,
  lng: 11.54915,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_139',
  type: AmenityType.toilet,
  lat: 48.1745324,
  lng: 11.5491017,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_140',
  type: AmenityType.toilet,
  lat: 48.2021952,
  lng: 11.415155,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_141',
  type: AmenityType.toilet,
  lat: 48.1005695,
  lng: 11.6223667,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_142',
  type: AmenityType.toilet,
  lat: 48.1002364,
  lng: 11.6054989,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_143',
  type: AmenityType.toilet,
  lat: 48.0853018,
  lng: 11.5410108,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_144',
  type: AmenityType.toilet,
  lat: 48.1168455,
  lng: 11.5392787,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_145',
  type: AmenityType.toilet,
  lat: 48.1177935,
  lng: 11.5624786,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_146',
  type: AmenityType.toilet,
  lat: 48.1641949,
  lng: 11.5017818,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_147',
  type: AmenityType.toilet,
  lat: 48.1202056,
  lng: 11.5954525,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_148',
  type: AmenityType.toilet,
  lat: 48.1272119,
  lng: 11.7111752,
  name: 'Public Toilet',
  description: 'Toiletten nur im Sommer vorhanden',
),

AmenityModel.fromCoordinates(
  id: 'toilet_149',
  type: AmenityType.toilet,
  lat: 48.1746814,
  lng: 11.5575871,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_150',
  type: AmenityType.toilet,
  lat: 48.0944481,
  lng: 11.5490017,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_151',
  type: AmenityType.toilet,
  lat: 48.1332049,
  lng: 11.5889197,
  name: 'Public Toilet',
  description: 'Dixiklo',
),

AmenityModel.fromCoordinates(
  id: 'toilet_152',
  type: AmenityType.toilet,
  lat: 48.1332789,
  lng: 11.6045348,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_153',
  type: AmenityType.toilet,
  lat: 48.1710077,
  lng: 11.5929316,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_154',
  type: AmenityType.toilet,
  lat: 48.1709666,
  lng: 11.593106,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_155',
  type: AmenityType.toilet,
  lat: 48.1606953,
  lng: 11.6033425,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_156',
  type: AmenityType.toilet,
  lat: 48.1438373,
  lng: 11.5863154,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_157',
  type: AmenityType.toilet,
  lat: 48.1411566,
  lng: 11.5582743,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_158',
  type: AmenityType.toilet,
  lat: 48.0885948,
  lng: 11.4805962,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_159',
  type: AmenityType.toilet,
  lat: 48.08871,
  lng: 11.4799634,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_160',
  type: AmenityType.toilet,
  lat: 48.0923718,
  lng: 11.5460145,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_161',
  type: AmenityType.toilet,
  lat: 48.1446763,
  lng: 11.5218816,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_162',
  type: AmenityType.toilet,
  lat: 48.0950702,
  lng: 11.4981639,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_163',
  type: AmenityType.toilet,
  lat: 48.0966327,
  lng: 11.5782732,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_164',
  type: AmenityType.toilet,
  lat: 48.0980486,
  lng: 11.5241153,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_165',
  type: AmenityType.toilet,
  lat: 48.0982273,
  lng: 11.5360496,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_166',
  type: AmenityType.toilet,
  lat: 48.0995114,
  lng: 11.5958355,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_167',
  type: AmenityType.toilet,
  lat: 48.1034638,
  lng: 11.4889961,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_168',
  type: AmenityType.toilet,
  lat: 48.1086964,
  lng: 11.5745468,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_169',
  type: AmenityType.toilet,
  lat: 48.1091187,
  lng: 11.5001106,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_170',
  type: AmenityType.toilet,
  lat: 48.1125749,
  lng: 11.5487971,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_171',
  type: AmenityType.toilet,
  lat: 48.116268,
  lng: 11.5026904,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_172',
  type: AmenityType.toilet,
  lat: 48.1190892,
  lng: 11.5653835,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_173',
  type: AmenityType.toilet,
  lat: 48.1178083,
  lng: 11.6080506,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_174',
  type: AmenityType.toilet,
  lat: 48.1184074,
  lng: 11.4899458,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_175',
  type: AmenityType.toilet,
  lat: 48.1204275,
  lng: 11.6194468,
  name: 'Public Toilet',
  description: 'Im Ubahn Zwischengeschoss',
),

AmenityModel.fromCoordinates(
  id: 'toilet_176',
  type: AmenityType.toilet,
  lat: 48.1231355,
  lng: 11.5278325,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_177',
  type: AmenityType.toilet,
  lat: 48.12948,
  lng: 11.5587982,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_178',
  type: AmenityType.toilet,
  lat: 48.1320518,
  lng: 11.6800393,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_179',
  type: AmenityType.toilet,
  lat: 48.1333783,
  lng: 11.6917267,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_180',
  type: AmenityType.toilet,
  lat: 48.1334118,
  lng: 11.7045287,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_181',
  type: AmenityType.toilet,
  lat: 48.1346979,
  lng: 11.5227247,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_182',
  type: AmenityType.toilet,
  lat: 48.1348587,
  lng: 11.5887049,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_183',
  type: AmenityType.toilet,
  lat: 48.1356001,
  lng: 11.5983218,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_184',
  type: AmenityType.toilet,
  lat: 48.1370451,
  lng: 11.4581546,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_185',
  type: AmenityType.toilet,
  lat: 48.139369,
  lng: 11.6071755,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_186',
  type: AmenityType.toilet,
  lat: 48.1394804,
  lng: 11.5889427,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_187',
  type: AmenityType.toilet,
  lat: 48.1488797,
  lng: 11.6166202,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_188',
  type: AmenityType.toilet,
  lat: 48.1510207,
  lng: 11.5813006,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_189',
  type: AmenityType.toilet,
  lat: 48.1532036,
  lng: 11.5334953,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_190',
  type: AmenityType.toilet,
  lat: 48.1543152,
  lng: 11.4093993,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_191',
  type: AmenityType.toilet,
  lat: 48.1547359,
  lng: 11.5665029,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_192',
  type: AmenityType.toilet,
  lat: 48.1694908,
  lng: 11.5286693,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_193',
  type: AmenityType.toilet,
  lat: 48.1777218,
  lng: 11.4604457,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_194',
  type: AmenityType.toilet,
  lat: 48.1801722,
  lng: 11.5554929,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_195',
  type: AmenityType.toilet,
  lat: 48.1800676,
  lng: 11.5731085,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_196',
  type: AmenityType.toilet,
  lat: 48.1820301,
  lng: 11.5293173,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_197',
  type: AmenityType.toilet,
  lat: 48.1879399,
  lng: 11.5725694,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_198',
  type: AmenityType.toilet,
  lat: 48.1930524,
  lng: 11.4166369,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_199',
  type: AmenityType.toilet,
  lat: 48.2004474,
  lng: 11.4571454,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_200',
  type: AmenityType.toilet,
  lat: 48.2047982,
  lng: 11.5693675,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_201',
  type: AmenityType.toilet,
  lat: 48.2128133,
  lng: 11.5627496,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_202',
  type: AmenityType.toilet,
  lat: 48.2138984,
  lng: 11.5416687,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_203',
  type: AmenityType.toilet,
  lat: 48.216013,
  lng: 11.5260136,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_204',
  type: AmenityType.toilet,
  lat: 48.1657965,
  lng: 11.5684652,
  name: 'Public Toilet',
  description: 'Mobile Toilette',
),

AmenityModel.fromCoordinates(
  id: 'toilet_205',
  type: AmenityType.toilet,
  lat: 48.101301,
  lng: 11.5292732,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_206',
  type: AmenityType.toilet,
  lat: 48.1020976,
  lng: 11.576028,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_207',
  type: AmenityType.toilet,
  lat: 48.1518674,
  lng: 11.5921279,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_208',
  type: AmenityType.toilet,
  lat: 48.2187665,
  lng: 11.6235641,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_209',
  type: AmenityType.toilet,
  lat: 48.1422734,
  lng: 11.5491352,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_210',
  type: AmenityType.toilet,
  lat: 48.1016461,
  lng: 11.5528541,
  name: 'Toilette für alle München Tierpark',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_211',
  type: AmenityType.toilet,
  lat: 48.1007745,
  lng: 11.6452999,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_212',
  type: AmenityType.toilet,
  lat: 48.1019066,
  lng: 11.5953577,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_213',
  type: AmenityType.toilet,
  lat: 48.0986024,
  lng: 11.6409554,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_214',
  type: AmenityType.toilet,
  lat: 48.0986617,
  lng: 11.6409835,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_215',
  type: AmenityType.toilet,
  lat: 48.1648665,
  lng: 11.4483334,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_216',
  type: AmenityType.toilet,
  lat: 48.1371507,
  lng: 11.4581729,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_217',
  type: AmenityType.toilet,
  lat: 48.177746,
  lng: 11.5565936,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_218',
  type: AmenityType.toilet,
  lat: 48.1752881,
  lng: 11.5663987,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_219',
  type: AmenityType.toilet,
  lat: 48.0903743,
  lng: 11.5205088,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_220',
  type: AmenityType.toilet,
  lat: 48.1500104,
  lng: 11.5115543,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_221',
  type: AmenityType.toilet,
  lat: 48.1436198,
  lng: 11.5890065,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_222',
  type: AmenityType.toilet,
  lat: 48.175053,
  lng: 11.5551042,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_223',
  type: AmenityType.toilet,
  lat: 48.1599266,
  lng: 11.5751425,
  name: 'Hering',
  description: 'Mit Euro-WC-Schlüssel',
),

AmenityModel.fromCoordinates(
  id: 'toilet_224',
  type: AmenityType.toilet,
  lat: 48.2138664,
  lng: 11.5416702,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_225',
  type: AmenityType.toilet,
  lat: 48.0939126,
  lng: 11.5512031,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_226',
  type: AmenityType.toilet,
  lat: 48.1352971,
  lng: 11.7047551,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_227',
  type: AmenityType.toilet,
  lat: 48.1528618,
  lng: 11.5592856,
  name: 'Toilette für alle',
  description: 'Die "Toilette für alle" befindet sich in der öffentlichen WC-Anlage im Maßmannpark und ist mit einem Euro-WC-Schlüssel zugängig. Die "Toilette für alle" ist ausgestattet mit einem Deckenlifter und einer höhenverstellbaren Pflegeliege.',
),

AmenityModel.fromCoordinates(
  id: 'toilet_228',
  type: AmenityType.toilet,
  lat: 48.1287928,
  lng: 11.5939664,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_229',
  type: AmenityType.toilet,
  lat: 48.1514921,
  lng: 11.5794901,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_230',
  type: AmenityType.toilet,
  lat: 48.1511707,
  lng: 11.5796916,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_231',
  type: AmenityType.toilet,
  lat: 48.2090232,
  lng: 11.5548219,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_232',
  type: AmenityType.toilet,
  lat: 48.1949148,
  lng: 11.6080852,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_233',
  type: AmenityType.toilet,
  lat: 48.1247787,
  lng: 11.6059456,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_234',
  type: AmenityType.toilet,
  lat: 48.1437512,
  lng: 11.4172532,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_235',
  type: AmenityType.toilet,
  lat: 48.1068486,
  lng: 11.5525912,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_236',
  type: AmenityType.toilet,
  lat: 48.1190327,
  lng: 11.5651859,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_237',
  type: AmenityType.toilet,
  lat: 48.1260505,
  lng: 11.576017,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_238',
  type: AmenityType.toilet,
  lat: 48.0894244,
  lng: 11.5247947,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_239',
  type: AmenityType.toilet,
  lat: 48.2011568,
  lng: 11.5280412,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_240',
  type: AmenityType.toilet,
  lat: 48.1965398,
  lng: 11.5384706,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_241',
  type: AmenityType.toilet,
  lat: 48.1990366,
  lng: 11.5390477,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_242',
  type: AmenityType.toilet,
  lat: 48.1743309,
  lng: 11.5543195,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_243',
  type: AmenityType.toilet,
  lat: 48.1256318,
  lng: 11.611206,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_244',
  type: AmenityType.toilet,
  lat: 48.1003065,
  lng: 11.5507197,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_245',
  type: AmenityType.toilet,
  lat: 48.1002974,
  lng: 11.5507198,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_246',
  type: AmenityType.toilet,
  lat: 48.1229328,
  lng: 11.516349,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_247',
  type: AmenityType.toilet,
  lat: 48.1227035,
  lng: 11.5259708,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_248',
  type: AmenityType.toilet,
  lat: 48.0933389,
  lng: 11.5491555,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_249',
  type: AmenityType.toilet,
  lat: 48.124951,
  lng: 11.6070438,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_250',
  type: AmenityType.toilet,
  lat: 48.1395857,
  lng: 11.6675629,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_251',
  type: AmenityType.toilet,
  lat: 48.1163042,
  lng: 11.5453724,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_252',
  type: AmenityType.toilet,
  lat: 48.1037113,
  lng: 11.5175016,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_253',
  type: AmenityType.toilet,
  lat: 48.1268582,
  lng: 11.7029789,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_254',
  type: AmenityType.toilet,
  lat: 48.1481159,
  lng: 11.51629,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_255',
  type: AmenityType.toilet,
  lat: 48.1135681,
  lng: 11.5768072,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_256',
  type: AmenityType.toilet,
  lat: 48.1186153,
  lng: 11.5664623,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_257',
  type: AmenityType.toilet,
  lat: 48.1114344,
  lng: 11.5642939,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_258',
  type: AmenityType.toilet,
  lat: 48.1387169,
  lng: 11.6065119,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_259',
  type: AmenityType.toilet,
  lat: 48.1497955,
  lng: 11.5180742,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_260',
  type: AmenityType.toilet,
  lat: 48.1472993,
  lng: 11.5160423,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_261',
  type: AmenityType.toilet,
  lat: 48.1453774,
  lng: 11.5106182,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_262',
  type: AmenityType.toilet,
  lat: 48.1536077,
  lng: 11.623182,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_263',
  type: AmenityType.toilet,
  lat: 48.1253813,
  lng: 11.6052658,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_264',
  type: AmenityType.toilet,
  lat: 48.125429,
  lng: 11.6053382,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_265',
  type: AmenityType.toilet,
  lat: 48.1324048,
  lng: 11.5941003,
  name: 'Public Toilet',
  description: 'Nur während der Gottesdienste geöffnet.',
),

AmenityModel.fromCoordinates(
  id: 'toilet_266',
  type: AmenityType.toilet,
  lat: 48.0903566,
  lng: 11.5072964,
  name: 'Kundentoilette',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_267',
  type: AmenityType.toilet,
  lat: 48.159393,
  lng: 11.5380838,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_268',
  type: AmenityType.toilet,
  lat: 48.1600856,
  lng: 11.5342491,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_269',
  type: AmenityType.toilet,
  lat: 48.1004234,
  lng: 11.4860042,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_270',
  type: AmenityType.toilet,
  lat: 48.191462,
  lng: 11.5567379,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_271',
  type: AmenityType.toilet,
  lat: 48.1118951,
  lng: 11.6425721,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_272',
  type: AmenityType.toilet,
  lat: 48.096152,
  lng: 11.5564276,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_273',
  type: AmenityType.toilet,
  lat: 48.1089716,
  lng: 11.500423,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_274',
  type: AmenityType.toilet,
  lat: 48.1549668,
  lng: 11.5560292,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_275',
  type: AmenityType.toilet,
  lat: 48.1543259,
  lng: 11.556351,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_276',
  type: AmenityType.toilet,
  lat: 48.1766348,
  lng: 11.4425802,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_277',
  type: AmenityType.toilet,
  lat: 48.159653,
  lng: 11.5491281,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_278',
  type: AmenityType.toilet,
  lat: 48.1543466,
  lng: 11.5569228,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_279',
  type: AmenityType.toilet,
  lat: 48.1411827,
  lng: 11.4508384,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_280',
  type: AmenityType.toilet,
  lat: 48.1417804,
  lng: 11.4502067,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_281',
  type: AmenityType.toilet,
  lat: 48.1924008,
  lng: 11.4988134,
  name: 'Toilet in HIT',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_282',
  type: AmenityType.toilet,
  lat: 48.0934415,
  lng: 11.6050365,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_283',
  type: AmenityType.toilet,
  lat: 48.1440223,
  lng: 11.6159281,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_284',
  type: AmenityType.toilet,
  lat: 48.1849175,
  lng: 11.6140419,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_285',
  type: AmenityType.toilet,
  lat: 48.1852005,
  lng: 11.6159394,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_286',
  type: AmenityType.toilet,
  lat: 48.1853685,
  lng: 11.6148144,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_287',
  type: AmenityType.toilet,
  lat: 48.110187,
  lng: 11.5290421,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_288',
  type: AmenityType.toilet,
  lat: 48.1823056,
  lng: 11.5304209,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_289',
  type: AmenityType.toilet,
  lat: 48.1830795,
  lng: 11.5322059,
  name: 'Public Toilet',
  description: 'inside the Galeria Kaufhof',
),

AmenityModel.fromCoordinates(
  id: 'toilet_290',
  type: AmenityType.toilet,
  lat: 48.1809263,
  lng: 11.5068604,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_291',
  type: AmenityType.toilet,
  lat: 48.0983742,
  lng: 11.5371982,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_292',
  type: AmenityType.toilet,
  lat: 48.1420333,
  lng: 11.5584535,
  name: 'Toilette im Sure Hotel',
  description: 'An Rezeption vorbei, dann Treppen links ins Untergeschoss. Auch von Hintereingang (Hirtenstraße) erreichbar.',
),

AmenityModel.fromCoordinates(
  id: 'toilet_293',
  type: AmenityType.toilet,
  lat: 48.1294476,
  lng: 11.5587281,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_294',
  type: AmenityType.toilet,
  lat: 48.1736434,
  lng: 11.5481698,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_295',
  type: AmenityType.toilet,
  lat: 48.1831341,
  lng: 11.535438,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_296',
  type: AmenityType.toilet,
  lat: 48.1066162,
  lng: 11.6451479,
  name: 'Public Toilet',
  description: 'Hinter den Aufzügen geht noch ein Gang rein, wo die Toiletten versteckt sind',
),

AmenityModel.fromCoordinates(
  id: 'toilet_297',
  type: AmenityType.toilet,
  lat: 48.2193581,
  lng: 11.5622915,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_298',
  type: AmenityType.toilet,
  lat: 48.1983839,
  lng: 11.4132188,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_299',
  type: AmenityType.toilet,
  lat: 48.1123258,
  lng: 11.5833537,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_300',
  type: AmenityType.toilet,
  lat: 48.115345,
  lng: 11.4773595,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_301',
  type: AmenityType.toilet,
  lat: 48.1220267,
  lng: 11.5550279,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_302',
  type: AmenityType.toilet,
  lat: 48.1194057,
  lng: 11.556405,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_303',
  type: AmenityType.toilet,
  lat: 48.1192663,
  lng: 11.5563894,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_304',
  type: AmenityType.toilet,
  lat: 48.1549677,
  lng: 11.5560325,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_305',
  type: AmenityType.toilet,
  lat: 48.1351069,
  lng: 11.5117025,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_306',
  type: AmenityType.toilet,
  lat: 48.1354846,
  lng: 11.5028123,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_307',
  type: AmenityType.toilet,
  lat: 48.1136259,
  lng: 11.5719714,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_308',
  type: AmenityType.toilet,
  lat: 48.1872662,
  lng: 11.5726942,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_309',
  type: AmenityType.toilet,
  lat: 48.1951849,
  lng: 11.5719462,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_310',
  type: AmenityType.toilet,
  lat: 48.1175878,
  lng: 11.635215,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_311',
  type: AmenityType.toilet,
  lat: 48.1627827,
  lng: 11.5327135,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_312',
  type: AmenityType.toilet,
  lat: 48.1489581,
  lng: 11.5801911,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_313',
  type: AmenityType.toilet,
  lat: 48.1406377,
  lng: 11.5751353,
  name: 'Toilette',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_314',
  type: AmenityType.toilet,
  lat: 48.1152005,
  lng: 11.5794718,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_315',
  type: AmenityType.toilet,
  lat: 48.1124232,
  lng: 11.5422671,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_316',
  type: AmenityType.toilet,
  lat: 48.0981765,
  lng: 11.5237876,
  name: 'Public Toilet',
  description: 'WC im Zwischengeschoss zur U-Bahn',
),

AmenityModel.fromCoordinates(
  id: 'toilet_317',
  type: AmenityType.toilet,
  lat: 48.1508457,
  lng: 11.5794785,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_318',
  type: AmenityType.toilet,
  lat: 48.137349,
  lng: 11.5803585,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_319',
  type: AmenityType.toilet,
  lat: 48.0813066,
  lng: 11.5410969,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_320',
  type: AmenityType.toilet,
  lat: 48.1354648,
  lng: 11.5764742,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_321',
  type: AmenityType.toilet,
  lat: 48.1324033,
  lng: 11.6047478,
  name: 'WC',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_322',
  type: AmenityType.toilet,
  lat: 48.1230973,
  lng: 11.5112485,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_323',
  type: AmenityType.toilet,
  lat: 48.1410729,
  lng: 11.4541707,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_324',
  type: AmenityType.toilet,
  lat: 48.1784775,
  lng: 11.5055489,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_325',
  type: AmenityType.toilet,
  lat: 48.1237852,
  lng: 11.5649267,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_326',
  type: AmenityType.toilet,
  lat: 48.1192418,
  lng: 11.556385,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_327',
  type: AmenityType.toilet,
  lat: 48.1220475,
  lng: 11.5550118,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_328',
  type: AmenityType.toilet,
  lat: 48.1468434,
  lng: 11.563564,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_329',
  type: AmenityType.toilet,
  lat: 48.1294845,
  lng: 11.6315506,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_330',
  type: AmenityType.toilet,
  lat: 48.095022,
  lng: 11.6563967,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_331',
  type: AmenityType.toilet,
  lat: 48.1318547,
  lng: 11.6913776,
  name: 'Public Toilet',
  description: 'Möglichkeit zum Stillen und Mikrowelle (kostenfrei) zum Brei erwärmen',
),

AmenityModel.fromCoordinates(
  id: 'toilet_332',
  type: AmenityType.toilet,
  lat: 48.1363605,
  lng: 11.5498478,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_333',
  type: AmenityType.toilet,
  lat: 48.0990375,
  lng: 11.6214371,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_334',
  type: AmenityType.toilet,
  lat: 48.1636492,
  lng: 11.534339,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_335',
  type: AmenityType.toilet,
  lat: 48.1427863,
  lng: 11.5781464,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_336',
  type: AmenityType.toilet,
  lat: 48.1742195,
  lng: 11.5708581,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_337',
  type: AmenityType.toilet,
  lat: 48.1193506,
  lng: 11.6708083,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_338',
  type: AmenityType.toilet,
  lat: 48.1845606,
  lng: 11.5434923,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_339',
  type: AmenityType.toilet,
  lat: 48.1633085,
  lng: 11.4571281,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_340',
  type: AmenityType.toilet,
  lat: 48.1555692,
  lng: 11.5536075,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_341',
  type: AmenityType.toilet,
  lat: 48.1556702,
  lng: 11.5534766,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_342',
  type: AmenityType.toilet,
  lat: 48.2187725,
  lng: 11.6259623,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_343',
  type: AmenityType.toilet,
  lat: 48.1006002,
  lng: 11.5959634,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_344',
  type: AmenityType.toilet,
  lat: 48.1247988,
  lng: 11.5837559,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_345',
  type: AmenityType.toilet,
  lat: 48.1214736,
  lng: 11.5814993,
  name: 'Public Toilet',
  description: 'öffentliches WC im Crönlein, daher nur zu den Öffnungszeiten des Crönlein zugänglich',
),

AmenityModel.fromCoordinates(
  id: 'toilet_346',
  type: AmenityType.toilet,
  lat: 48.2132359,
  lng: 11.5561943,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_347',
  type: AmenityType.toilet,
  lat: 48.1568267,
  lng: 11.5738846,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_348',
  type: AmenityType.toilet,
  lat: 48.1581723,
  lng: 11.5030975,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_349',
  type: AmenityType.toilet,
  lat: 48.1431655,
  lng: 11.541941,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_350',
  type: AmenityType.toilet,
  lat: 48.1349635,
  lng: 11.5515732,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_351',
  type: AmenityType.toilet,
  lat: 48.1349919,
  lng: 11.5516134,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_352',
  type: AmenityType.toilet,
  lat: 48.1563049,
  lng: 11.5819973,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_353',
  type: AmenityType.toilet,
  lat: 48.1565254,
  lng: 11.5822017,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_354',
  type: AmenityType.toilet,
  lat: 48.1137884,
  lng: 11.4677749,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_355',
  type: AmenityType.toilet,
  lat: 48.1137822,
  lng: 11.4676921,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_356',
  type: AmenityType.toilet,
  lat: 48.1448098,
  lng: 11.5218014,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_357',
  type: AmenityType.toilet,
  lat: 48.1447526,
  lng: 11.5215847,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_358',
  type: AmenityType.toilet,
  lat: 48.1447725,
  lng: 11.5224117,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_359',
  type: AmenityType.toilet,
  lat: 48.1447483,
  lng: 11.5224083,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_360',
  type: AmenityType.toilet,
  lat: 48.1448018,
  lng: 11.5229825,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_361',
  type: AmenityType.toilet,
  lat: 48.1880468,
  lng: 11.5483336,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_362',
  type: AmenityType.toilet,
  lat: 48.1482784,
  lng: 11.5147635,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_363',
  type: AmenityType.toilet,
  lat: 48.147442,
  lng: 11.5144411,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_364',
  type: AmenityType.toilet,
  lat: 48.1465616,
  lng: 11.5096828,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_365',
  type: AmenityType.toilet,
  lat: 48.1471458,
  lng: 11.5244289,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_366',
  type: AmenityType.toilet,
  lat: 48.1471941,
  lng: 11.5242867,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_367',
  type: AmenityType.toilet,
  lat: 48.1371273,
  lng: 11.5719515,
  name: 'Public Toilet',
  description: 'OSM amenity: toilets',
),

AmenityModel.fromCoordinates(
  id: 'toilet_368',
  type: AmenityType.toilet,
  lat: 48.1431761,
  lng: 11.5420669,
  name: 'Toilette',
  description: 'OSM amenity: toilets',
),

  ];

  // Drinkable water supply locations in Munich area (manually added)
  static final List<AmenityModel> manualWaterSupplies = [
    AmenityModel.fromCoordinates(
  id: 'water_1',
  type: AmenityType.waterSupply,
  lat: 48.1400098,
  lng: 11.5869487,
  name: 'Sankt-Anna-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_2',
  type: AmenityType.waterSupply,
  lat: 48.1139242,
  lng: 11.5746348,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_3',
  type: AmenityType.waterSupply,
  lat: 48.139286,
  lng: 11.5888453,
  name: 'Schnitterin-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_4',
  type: AmenityType.waterSupply,
  lat: 48.1344745,
  lng: 11.595933,
  name: 'Fischerbuberl',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_5',
  type: AmenityType.waterSupply,
  lat: 48.1350872,
  lng: 11.5762598,
  name: 'Liesl-Karlstadt-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_6',
  type: AmenityType.waterSupply,
  lat: 48.1356076,
  lng: 11.5766523,
  name: 'Roider-Jackl-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_7',
  type: AmenityType.waterSupply,
  lat: 48.1359612,
  lng: 11.5768753,
  name: 'Elise-Aulinger-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_8',
  type: AmenityType.waterSupply,
  lat: 48.1349723,
  lng: 11.5754761,
  name: 'Karl-Valentin-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_9',
  type: AmenityType.waterSupply,
  lat: 48.1347495,
  lng: 11.5764677,
  name: 'Ida-Schumacher-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_10',
  type: AmenityType.waterSupply,
  lat: 48.1565041,
  lng: 11.5315034,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_11',
  type: AmenityType.waterSupply,
  lat: 48.1584012,
  lng: 11.5285043,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_12',
  type: AmenityType.waterSupply,
  lat: 48.1572012,
  lng: 11.5740299,
  name: 'Bärenbrunnen',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_13',
  type: AmenityType.waterSupply,
  lat: 48.1174508,
  lng: 11.5817574,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_14',
  type: AmenityType.waterSupply,
  lat: 48.0757364,
  lng: 11.5427322,
  name: 'St.-Martin-Brunnen',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_15',
  type: AmenityType.waterSupply,
  lat: 48.1370807,
  lng: 11.5913396,
  name: 'Bürgermeister-Erhardt-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_16',
  type: AmenityType.waterSupply,
  lat: 48.1602468,
  lng: 11.5333033,
  name: 'Heraklesbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_17',
  type: AmenityType.waterSupply,
  lat: 48.1697168,
  lng: 11.5896421,
  name: 'Berolinabrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_18',
  type: AmenityType.waterSupply,
  lat: 48.1258515,
  lng: 11.5830348,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_19',
  type: AmenityType.waterSupply,
  lat: 48.1504188,
  lng: 11.5578237,
  name: 'Fischmarktbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_20',
  type: AmenityType.waterSupply,
  lat: 48.11775,
  lng: 11.6341181,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_21',
  type: AmenityType.waterSupply,
  lat: 48.1168361,
  lng: 11.5880193,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_22',
  type: AmenityType.waterSupply,
  lat: 48.1361543,
  lng: 11.5789946,
  name: 'Merkurbrunnen',
  description: 'Merkurbrunnen nach Entwurf Friedrich von Thierschs von 1902 durch den Bildhauer Hugo Kaufmann ausgeführt (Nachbildung der Figur des Giovanni Bologna von ca. 1580); 1911 Aufstellung auf dem Maximiliansplatz, 1975 hier.',
),

AmenityModel.fromCoordinates(
  id: 'water_23',
  type: AmenityType.waterSupply,
  lat: 48.1384001,
  lng: 11.5809389,
  name: 'Wolfsbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_24',
  type: AmenityType.waterSupply,
  lat: 48.1347707,
  lng: 11.5760733,
  name: 'Kartoffelbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_25',
  type: AmenityType.waterSupply,
  lat: 48.1355289,
  lng: 11.5760881,
  name: 'Honigbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_26',
  type: AmenityType.waterSupply,
  lat: 48.1352407,
  lng: 11.5763637,
  name: 'Weiß-Ferdl-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_27',
  type: AmenityType.waterSupply,
  lat: 48.1717308,
  lng: 11.5675545,
  name: 'Pumucklbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_28',
  type: AmenityType.waterSupply,
  lat: 48.1574886,
  lng: 11.415472,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_29',
  type: AmenityType.waterSupply,
  lat: 48.1586815,
  lng: 11.5865765,
  name: 'Fischerbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_30',
  type: AmenityType.waterSupply,
  lat: 48.1310776,
  lng: 11.5961462,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_31',
  type: AmenityType.waterSupply,
  lat: 48.1140214,
  lng: 11.6148943,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_32',
  type: AmenityType.waterSupply,
  lat: 48.1273997,
  lng: 11.6418226,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_33',
  type: AmenityType.waterSupply,
  lat: 48.1389217,
  lng: 11.5730974,
  name: 'St. Benno-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_34',
  type: AmenityType.waterSupply,
  lat: 48.1323236,
  lng: 11.5997553,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_35',
  type: AmenityType.waterSupply,
  lat: 48.1350454,
  lng: 11.5970532,
  name: 'Zylinderbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_36',
  type: AmenityType.waterSupply,
  lat: 48.1353631,
  lng: 11.5980858,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_37',
  type: AmenityType.waterSupply,
  lat: 48.1168902,
  lng: 11.6765871,
  name: 'Drudenbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_38',
  type: AmenityType.waterSupply,
  lat: 48.139772,
  lng: 11.6812958,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_39',
  type: AmenityType.waterSupply,
  lat: 48.110797,
  lng: 11.6671127,
  name: 'Friedrich Ebert',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_40',
  type: AmenityType.waterSupply,
  lat: 48.1161593,
  lng: 11.5770957,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_41',
  type: AmenityType.waterSupply,
  lat: 48.1246222,
  lng: 11.588193,
  name: 'Reiherbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_42',
  type: AmenityType.waterSupply,
  lat: 48.1287534,
  lng: 11.5861193,
  name: 'Augia-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_43',
  type: AmenityType.waterSupply,
  lat: 48.1120903,
  lng: 11.5846609,
  name: 'Brunnenbuaberl',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_44',
  type: AmenityType.waterSupply,
  lat: 48.1191326,
  lng: 11.5839601,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_45',
  type: AmenityType.waterSupply,
  lat: 48.1214581,
  lng: 11.5815029,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_46',
  type: AmenityType.waterSupply,
  lat: 48.1214927,
  lng: 11.5801889,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_47',
  type: AmenityType.waterSupply,
  lat: 48.1259146,
  lng: 11.5858935,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_48',
  type: AmenityType.waterSupply,
  lat: 48.1144874,
  lng: 11.5629767,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_49',
  type: AmenityType.waterSupply,
  lat: 48.1006118,
  lng: 11.5800814,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_50',
  type: AmenityType.waterSupply,
  lat: 48.1210438,
  lng: 11.5619076,
  name: 'Roecklbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_51',
  type: AmenityType.waterSupply,
  lat: 48.1221163,
  lng: 11.5698068,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_52',
  type: AmenityType.waterSupply,
  lat: 48.1627526,
  lng: 11.571263,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_53',
  type: AmenityType.waterSupply,
  lat: 48.1656799,
  lng: 11.5790758,
  name: 'Seehundbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_54',
  type: AmenityType.waterSupply,
  lat: 48.1331182,
  lng: 11.563512,
  name: 'Friedrich Bezold',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_55',
  type: AmenityType.waterSupply,
  lat: 48.1368526,
  lng: 11.576613,
  name: 'Kräutlmarktbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_56',
  type: AmenityType.waterSupply,
  lat: 48.1688582,
  lng: 11.5675061,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_57',
  type: AmenityType.waterSupply,
  lat: 48.1703793,
  lng: 11.578191,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_58',
  type: AmenityType.waterSupply,
  lat: 48.151223,
  lng: 11.5214778,
  name: 'Knabenbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_59',
  type: AmenityType.waterSupply,
  lat: 48.1202087,
  lng: 11.6553477,
  name: 'Schnitterin-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_60',
  type: AmenityType.waterSupply,
  lat: 48.1467787,
  lng: 11.462126,
  name: 'Hochzeitsbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_61',
  type: AmenityType.waterSupply,
  lat: 48.1284714,
  lng: 11.5001041,
  name: 'Peterl-Brunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_62',
  type: AmenityType.waterSupply,
  lat: 48.1444246,
  lng: 11.4557613,
  name: 'Drinking Water Fountain',
  description: 'Kleiner Brunnen mit Christophorusfigur an der Mauer',
),

AmenityModel.fromCoordinates(
  id: 'water_63',
  type: AmenityType.waterSupply,
  lat: 48.0920159,
  lng: 11.5481909,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_64',
  type: AmenityType.waterSupply,
  lat: 48.1414497,
  lng: 11.5712265,
  name: 'Grottenbrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_65',
  type: AmenityType.waterSupply,
  lat: 48.1566906,
  lng: 11.5025674,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_66',
  type: AmenityType.waterSupply,
  lat: 48.1587953,
  lng: 11.5027858,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_67',
  type: AmenityType.waterSupply,
  lat: 48.1530607,
  lng: 11.6347883,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_68',
  type: AmenityType.waterSupply,
  lat: 48.1679971,
  lng: 11.527864,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_69',
  type: AmenityType.waterSupply,
  lat: 48.1126312,
  lng: 11.5132174,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_70',
  type: AmenityType.waterSupply,
  lat: 48.1291263,
  lng: 11.631607,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_71',
  type: AmenityType.waterSupply,
  lat: 48.0738328,
  lng: 11.5126479,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_72',
  type: AmenityType.waterSupply,
  lat: 48.1528116,
  lng: 11.5276594,
  name: 'Gänsebrunnen',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_73',
  type: AmenityType.waterSupply,
  lat: 48.1075537,
  lng: 11.5860562,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_74',
  type: AmenityType.waterSupply,
  lat: 48.2175894,
  lng: 11.6302113,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_75',
  type: AmenityType.waterSupply,
  lat: 48.1227072,
  lng: 11.5934128,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_76',
  type: AmenityType.waterSupply,
  lat: 48.1362861,
  lng: 11.5736694,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_77',
  type: AmenityType.waterSupply,
  lat: 48.1144642,
  lng: 11.5429377,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_78',
  type: AmenityType.waterSupply,
  lat: 48.1039925,
  lng: 11.5641742,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_79',
  type: AmenityType.waterSupply,
  lat: 48.1041904,
  lng: 11.5643922,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_80',
  type: AmenityType.waterSupply,
  lat: 48.1038573,
  lng: 11.5639999,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_81',
  type: AmenityType.waterSupply,
  lat: 48.0933059,
  lng: 11.5511589,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_82',
  type: AmenityType.waterSupply,
  lat: 48.0998623,
  lng: 11.4793237,
  name: 'Drinking Water Fountain',
  description: 'OSM water point',
),

AmenityModel.fromCoordinates(
  id: 'water_83',
  type: AmenityType.waterSupply,
  lat: 48.1004227,
  lng: 11.4792747,
  name: 'Drinking Water Fountain',
  description: 'OSM water point',
),

AmenityModel.fromCoordinates(
  id: 'water_84',
  type: AmenityType.waterSupply,
  lat: 48.1000858,
  lng: 11.4807071,
  name: 'Drinking Water Fountain',
  description: 'OSM water point',
),

AmenityModel.fromCoordinates(
  id: 'water_85',
  type: AmenityType.waterSupply,
  lat: 48.1354432,
  lng: 11.570766,
  name: 'Drinking Water Fountain',
  description: 'Holzabdeckung im Winter',
),

AmenityModel.fromCoordinates(
  id: 'water_86',
  type: AmenityType.waterSupply,
  lat: 48.128495,
  lng: 11.6031565,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_87',
  type: AmenityType.waterSupply,
  lat: 48.1342276,
  lng: 11.5734468,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_88',
  type: AmenityType.waterSupply,
  lat: 48.178497,
  lng: 11.5542268,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_89',
  type: AmenityType.waterSupply,
  lat: 48.1678254,
  lng: 11.5018225,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_90',
  type: AmenityType.waterSupply,
  lat: 48.1138996,
  lng: 11.6150316,
  name: 'Kennedy-Brünnlein',
  description: 'OSM amenity: fountain',
),

AmenityModel.fromCoordinates(
  id: 'water_91',
  type: AmenityType.waterSupply,
  lat: 48.1775846,
  lng: 11.5818469,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_92',
  type: AmenityType.waterSupply,
  lat: 48.1775864,
  lng: 11.5819798,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_93',
  type: AmenityType.waterSupply,
  lat: 48.1775408,
  lng: 11.5819188,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_94',
  type: AmenityType.waterSupply,
  lat: 48.1774946,
  lng: 11.5819201,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_95',
  type: AmenityType.waterSupply,
  lat: 48.1774911,
  lng: 11.5818526,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_96',
  type: AmenityType.waterSupply,
  lat: 48.1775384,
  lng: 11.5818517,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_97',
  type: AmenityType.waterSupply,
  lat: 48.1355357,
  lng: 11.5760921,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_98',
  type: AmenityType.waterSupply,
  lat: 48.1377498,
  lng: 11.4965862,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_99',
  type: AmenityType.waterSupply,
  lat: 48.1172469,
  lng: 11.5396564,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_100',
  type: AmenityType.waterSupply,
  lat: 48.1465704,
  lng: 11.4100811,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_101',
  type: AmenityType.waterSupply,
  lat: 48.1481277,
  lng: 11.5161798,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_102',
  type: AmenityType.waterSupply,
  lat: 48.1528271,
  lng: 11.5593393,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_103',
  type: AmenityType.waterSupply,
  lat: 48.112443,
  lng: 11.5422772,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_104',
  type: AmenityType.waterSupply,
  lat: 48.1037998,
  lng: 11.5127206,
  name: 'Drinking Water Fountain',
  description: 'OSM water point',
),

AmenityModel.fromCoordinates(
  id: 'water_105',
  type: AmenityType.waterSupply,
  lat: 48.1568691,
  lng: 11.5745912,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_106',
  type: AmenityType.waterSupply,
  lat: 48.1636323,
  lng: 11.5343461,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_107',
  type: AmenityType.waterSupply,
  lat: 48.1339992,
  lng: 11.5384318,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_108',
  type: AmenityType.waterSupply,
  lat: 48.0907797,
  lng: 11.6590523,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_109',
  type: AmenityType.waterSupply,
  lat: 48.1438814,
  lng: 11.5389851,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_110',
  type: AmenityType.waterSupply,
  lat: 48.1625171,
  lng: 11.5008167,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_111',
  type: AmenityType.waterSupply,
  lat: 48.1321995,
  lng: 11.5629652,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_112',
  type: AmenityType.waterSupply,
  lat: 48.1099702,
  lng: 11.6302773,
  name: 'Drinking Water Fountain',
  description: 'OSM water point',
),

AmenityModel.fromCoordinates(
  id: 'water_113',
  type: AmenityType.waterSupply,
  lat: 48.1364304,
  lng: 11.551384,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_114',
  type: AmenityType.waterSupply,
  lat: 48.1817874,
  lng: 11.5445002,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_115',
  type: AmenityType.waterSupply,
  lat: 48.1725176,
  lng: 11.5546862,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_116',
  type: AmenityType.waterSupply,
  lat: 48.1431527,
  lng: 11.5419239,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_117',
  type: AmenityType.waterSupply,
  lat: 48.1233168,
  lng: 11.6223186,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_118',
  type: AmenityType.waterSupply,
  lat: 48.1632542,
  lng: 11.5868624,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_119',
  type: AmenityType.waterSupply,
  lat: 48.1606966,
  lng: 11.6306877,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_120',
  type: AmenityType.waterSupply,
  lat: 48.1247925,
  lng: 11.5837144,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_121',
  type: AmenityType.waterSupply,
  lat: 48.1393554,
  lng: 11.5664153,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_122',
  type: AmenityType.waterSupply,
  lat: 48.0935416,
  lng: 11.6046681,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_123',
  type: AmenityType.waterSupply,
  lat: 48.15543,
  lng: 11.5667321,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_124',
  type: AmenityType.waterSupply,
  lat: 48.2123608,
  lng: 11.5636447,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_125',
  type: AmenityType.waterSupply,
  lat: 48.1243664,
  lng: 11.6057922,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_126',
  type: AmenityType.waterSupply,
  lat: 48.0998937,
  lng: 11.5516427,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_127',
  type: AmenityType.waterSupply,
  lat: 48.1075784,
  lng: 11.5852093,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_128',
  type: AmenityType.waterSupply,
  lat: 48.1016363,
  lng: 11.5529129,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_129',
  type: AmenityType.waterSupply,
  lat: 48.1320904,
  lng: 11.5532912,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_130',
  type: AmenityType.waterSupply,
  lat: 48.1324869,
  lng: 11.7043612,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_131',
  type: AmenityType.waterSupply,
  lat: 48.0923536,
  lng: 11.5425883,
  name: 'Drinking Water Fountain',
  description: 'Free tap water',
),

AmenityModel.fromCoordinates(
  id: 'water_132',
  type: AmenityType.waterSupply,
  lat: 48.1818593,
  lng: 11.5299252,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_133',
  type: AmenityType.waterSupply,
  lat: 48.0998462,
  lng: 11.6470481,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),

AmenityModel.fromCoordinates(
  id: 'water_134',
  type: AmenityType.waterSupply,
  lat: 48.131393,
  lng: 11.6909479,
  name: 'Drinking Water Fountain',
  description: 'OSM amenity: drinking_water',
),
  ];

  // Combined list of all toilets
  static List<AmenityModel> get toilets => manualToilets;

  // Combined list of all water supplies
  static List<AmenityModel> get waterSupplies => manualWaterSupplies;

  // Combined list of all amenities
  static List<AmenityModel> get allAmenities => [
    ...toilets,
    ...waterSupplies,
  ];

  // Load from GeoJSON FeatureCollection
  static List<AmenityModel> fromGeoJSON(Map<String, dynamic> geoJson) {
    final features = geoJson['features'] as List<dynamic>? ?? [];
    return features
        .map((feature) => AmenityModel.fromGeoJSON(feature as Map<String, dynamic>))
        .toList();
  }
}

