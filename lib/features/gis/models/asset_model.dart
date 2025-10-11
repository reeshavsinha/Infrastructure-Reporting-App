import 'package:latlong2/latlong.dart';

class Asset {
  final String id;
  final LatLng point;
  final String type;

  Asset({required this.id, required this.point, required this.type});
}
