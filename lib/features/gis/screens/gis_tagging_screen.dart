import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_application_1/features/gis/models/asset_model.dart';
import 'package:flutter_application_1/features/gis/providers/gis_providers.dart';
import 'package:flutter_application_1/features/gis/repository/gis_repository.dart';

class GisTaggingScreen extends ConsumerWidget {
  const GisTaggingScreen({super.key});

  // Helper method to build a marker
  Marker _buildMarker(Asset asset) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: asset.point,
      child: Tooltip(
        message: asset.type,
        child: Icon(
          _getIconForAssetType(asset.type),
          color: Colors.blue,
          size: 45.0,
        ),
      ),
    );
  }

  // Helper to return an icon based on asset type
  IconData _getIconForAssetType(String type) {
    switch (type.toLowerCase()) {
      case 'school':
        return Icons.school;
      case 'hospital':
        return Icons.local_hospital;
      case 'well':
        return Icons.water_drop;
      default:
        return Icons.location_pin;
    }
  }

  // Method to get the current location and save it as a new asset
  Future<void> _tagNewAsset(BuildContext context, WidgetRef ref) async {
    // 1. Check permissions and get current position
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (context.mounted)
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Location permissions are denied.')));
        return;
      }
    }

    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final newPoint = LatLng(position.latitude, position.longitude);

      // 2. Create a new Asset object
      final newAsset = Asset(
        id: const Uuid().v4(), // Generate a unique ID
        point: newPoint,
        type: 'New Asset', // Default type, a real app would show a form
      );

      // 3. Save the new asset using the repository
      await ref.read(gisRepositoryProvider).saveNewAsset(newAsset);

      // 4. Invalidate the provider to force a refresh
      ref.invalidate(assetsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New asset tagged and saved!')),
        );
      }
    } catch (e) {
      if (context.mounted)
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not get location: $e')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the list of assets
    final assetsAsync = ref.watch(assetsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('GIS Asset Tagging')),
      body: assetsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Error loading assets: $err')),
        data: (assets) {
          // Build the list of markers from the fetched assets
          final markers = assets.map((asset) => _buildMarker(asset)).toList();

          return FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(22.5726, 88.3639),
              initialZoom: 5.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flutter_application_1',
              ),
              MarkerLayer(markers: markers),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _tagNewAsset(context, ref),
        label: const Text('Tag New Asset'),
        icon: const Icon(Icons.my_location),
      ),
    );
  }
}
