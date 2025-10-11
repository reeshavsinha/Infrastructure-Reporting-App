//import 'package:collection/collection.dart';
import 'package:flutter_application_1/features/village_management/models/village_model.dart';
import 'package:flutter_application_1/features/village_management/providers/village_filter_providers.dart';
import 'package:flutter_application_1/features/village_management/repository/village_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'village_providers.g.dart';

// --- PROVIDERS FOR HIERARCHICAL NAVIGATION ---

// Provider to get a unique, sorted list of all states
@riverpod
Future<List<String>> states(StatesRef ref) async {
  final allVillages = await ref.watch(villageRepositoryProvider).getVillages();
  // Using .toSet() to get unique values
  final states = allVillages.map((v) => v.state).toSet().toList();
  states.sort();
  return states;
}

// Provider to get a unique, sorted list of districts for a GIVEN state
@riverpod
Future<List<String>> districtsForState(
    DistrictsForStateRef ref, String stateName) async {
  final allVillages = await ref.watch(villageRepositoryProvider).getVillages();
  final districts = allVillages
      .where((v) => v.state == stateName)
      .map((v) => v.district)
      .toSet()
      .toList();
  districts.sort();
  return districts;
}

// --- UPDATED VILLAGES PROVIDER ---

// Provider that takes a district name and filters villages for that district
@riverpod
Future<List<Village>> villagesForDistrict(
    VillagesForDistrictRef ref, String districtName) async {
  final searchQuery = ref.watch(villageSearchQueryProvider);
  final allVillages = await ref.watch(villageRepositoryProvider).getVillages();

  // Filter by the selected district first
  var filteredVillages =
      allVillages.where((v) => v.district == districtName).toList();

  // Then, apply the search query if it exists
  if (searchQuery.isNotEmpty) {
    final query = searchQuery.toLowerCase();
    filteredVillages = filteredVillages.where((village) {
      return village.name.toLowerCase().contains(query);
    }).toList();
  }

  return filteredVillages;
}

// Provider for fetching a single village's details
@riverpod
Future<Village> villageDetails(VillageDetailsRef ref, String villageId) {
  return ref.watch(villageRepositoryProvider).getVillageDetails(villageId);
}
