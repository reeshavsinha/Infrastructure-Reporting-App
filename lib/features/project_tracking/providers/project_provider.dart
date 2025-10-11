import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/data/mock_database.dart';
import 'package:flutter_application_1/core/models/project_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_provider.g.dart';

// A simple class to hold all filter states together
class ProjectFilters {
  final ProjectStatus? status;
  final ProjectCategory? category;
  final ProjectPriority? priority;
  const ProjectFilters({this.status, this.category, this.priority});
}

// --- UI State Providers ---

@riverpod
class ProjectSearchQuery extends _$ProjectSearchQuery {
  @override
  String build() => '';
  void setQuery(String query) => state = query;
}

@riverpod
class ProjectFiltersNotifier extends _$ProjectFiltersNotifier {
  @override
  ProjectFilters build() => const ProjectFilters();
  void setFilters(ProjectFilters newFilters) => state = newFilters;
  void clearFilters() => state = const ProjectFilters();
}

// --- CORE & DERIVED DATA PROVIDERS ---

@riverpod
Future<List<Project>> allProjects(AllProjectsRef ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  return mockProjects.map((json) => Project.fromJson(json)).toList();
}

@riverpod
List<Project> filteredProjects(FilteredProjectsRef ref) {
  final allProjectsAsync = ref.watch(allProjectsProvider);

  return allProjectsAsync.when(
    data: (projects) {
      final searchQuery = ref.watch(projectSearchQueryProvider);
      final filters = ref.watch(projectFiltersNotifierProvider);

      List<Project> filteredList = List.from(projects);

      if (searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        filteredList = filteredList
            .where((p) =>
                p.name.toLowerCase().contains(query) ||
                p.village.toLowerCase().contains(query))
            .toList();
      }

      if (filters.status != null) {
        filteredList =
            filteredList.where((p) => p.status == filters.status).toList();
      }
      if (filters.category != null) {
        filteredList =
            filteredList.where((p) => p.category == filters.category).toList();
      }
      if (filters.priority != null) {
        filteredList =
            filteredList.where((p) => p.priority == filters.priority).toList();
      }

      return filteredList;
    },
    loading: () => [],
    error: (e, s) => [],
  );
}

@riverpod
Map<String, dynamic> projectStats(ProjectStatsRef ref) {
  final projects = ref.watch(filteredProjectsProvider);
  if (projects.isEmpty) return {};

  final totalProjects = projects.length;
  final completedProjects =
      projects.where((p) => p.status == ProjectStatus.completed).length;

  return {
    'total': totalProjects,
    'completed': completedProjects,
    'ongoing': projects.where((p) => p.status == ProjectStatus.ongoing).length,
    'delayed': projects.where((p) => p.status == ProjectStatus.delayed).length,
    'pending': projects.where((p) => p.status == ProjectStatus.pending).length,
    'overdue': projects.where((p) => p.isOverdue).length,
    'totalBudget': projects.fold<int>(0, (sum, p) => sum + p.budget),
    'completionRate':
        totalProjects > 0 ? (completedProjects / totalProjects * 100) : 0,
  };
}

@riverpod
Project? projectById(ProjectByIdRef ref, String projectId) {
  final projects = ref.watch(allProjectsProvider).valueOrNull;
  if (projects == null) return null;

  return projects.firstWhereOrNull((project) => project.id == projectId);
}

@riverpod
List<Project> projectsForVillage(
    ProjectsForVillageRef ref, String villageName) {
  final allProjects = ref.watch(allProjectsProvider).valueOrNull;
  if (allProjects == null) return [];

  return allProjects.where((p) => p.village == villageName).toList();
}
