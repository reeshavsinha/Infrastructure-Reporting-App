import 'package:flutter_application_1/features/gis/models/asset_model.dart';
import 'package:flutter_application_1/features/gis/repository/gis_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gis_providers.g.dart';

// This provider fetches the list of assets and will automatically refetch when invalidated
@riverpod
Future<List<Asset>> assets(AssetsRef ref) async {
  return ref.watch(gisRepositoryProvider).getAssets();
}
