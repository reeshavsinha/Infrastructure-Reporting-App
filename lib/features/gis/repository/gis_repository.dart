import 'package:flutter_application_1/core/data/mock_database.dart';
import 'package:flutter_application_1/features/gis/models/asset_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gis_repository.g.dart';

class GisRepository {
  // Simulate a database table in memory
  final List<Map<String, dynamic>> _assetsDB = List.from(mockAssets);

  // Simulates fetching all assets from the database
  Future<List<Asset>> getAssets() async {
    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate network latency
    return _assetsDB
        .map((data) => Asset(
              id: data['id'],
              point: LatLng(data['lat'], data['lng']),
              type: data['type'],
            ))
        .toList();
  }

  // Simulates saving a new asset to the database
  Future<void> saveNewAsset(Asset asset) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _assetsDB.add({
      "id": asset.id,
      "lat": asset.point.latitude,
      "lng": asset.point.longitude,
      "type": asset.type,
    });
    print("New asset saved. Total assets: ${_assetsDB.length}");
  }
}

@riverpod
GisRepository gisRepository(GisRepositoryRef ref) {
  return GisRepository();
}
