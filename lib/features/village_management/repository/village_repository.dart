import 'package:flutter_application_1/core/data/mock_database.dart';
import 'package:flutter_application_1/features/village_management/models/village_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'village_repository.g.dart';

class VillageRepository {
  // Simulates fetching all villages
  Future<List<Village>> getVillages() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    // In a real app, you would fetch from Supabase.
    // Here we parse our mock data.
    return mockVillages.map((json) => Village.fromJson(json)).toList();
  }

  // Simulates fetching details for a single village
  Future<Village> getVillageDetails(String villageId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final villageJson = mockVillages.firstWhere((v) => v['id'] == villageId);
    return Village.fromJson(villageJson);
    // In real app, would add logic here to cache this result in Isar (local DB)
  }
}

@riverpod
VillageRepository villageRepository(VillageRepositoryRef ref) {
  return VillageRepository();
}
