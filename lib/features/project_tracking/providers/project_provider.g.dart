// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allProjectsHash() => r'aca8d49d78dccd66a680eaacdff340c479dfb685';

/// See also [allProjects].
@ProviderFor(allProjects)
final allProjectsProvider = AutoDisposeFutureProvider<List<Project>>.internal(
  allProjects,
  name: r'allProjectsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllProjectsRef = AutoDisposeFutureProviderRef<List<Project>>;
String _$filteredProjectsHash() => r'b8ccc558f98b23a82521f05778f620b2071a9880';

/// See also [filteredProjects].
@ProviderFor(filteredProjects)
final filteredProjectsProvider = AutoDisposeProvider<List<Project>>.internal(
  filteredProjects,
  name: r'filteredProjectsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredProjectsRef = AutoDisposeProviderRef<List<Project>>;
String _$projectStatsHash() => r'44690941d1dd936c4cb9b5a1b5e66247ac88fd4a';

/// See also [projectStats].
@ProviderFor(projectStats)
final projectStatsProvider = AutoDisposeProvider<Map<String, dynamic>>.internal(
  projectStats,
  name: r'projectStatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$projectStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectStatsRef = AutoDisposeProviderRef<Map<String, dynamic>>;
String _$projectByIdHash() => r'aef1c9fdc25ea86ae307119adff088b6200c4e1b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [projectById].
@ProviderFor(projectById)
const projectByIdProvider = ProjectByIdFamily();

/// See also [projectById].
class ProjectByIdFamily extends Family<Project?> {
  /// See also [projectById].
  const ProjectByIdFamily();

  /// See also [projectById].
  ProjectByIdProvider call(
    String projectId,
  ) {
    return ProjectByIdProvider(
      projectId,
    );
  }

  @override
  ProjectByIdProvider getProviderOverride(
    covariant ProjectByIdProvider provider,
  ) {
    return call(
      provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectByIdProvider';
}

/// See also [projectById].
class ProjectByIdProvider extends AutoDisposeProvider<Project?> {
  /// See also [projectById].
  ProjectByIdProvider(
    String projectId,
  ) : this._internal(
          (ref) => projectById(
            ref as ProjectByIdRef,
            projectId,
          ),
          from: projectByIdProvider,
          name: r'projectByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectByIdHash,
          dependencies: ProjectByIdFamily._dependencies,
          allTransitiveDependencies:
              ProjectByIdFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final String projectId;

  @override
  Override overrideWith(
    Project? Function(ProjectByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectByIdProvider._internal(
        (ref) => create(ref as ProjectByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Project?> createElement() {
    return _ProjectByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectByIdProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectByIdRef on AutoDisposeProviderRef<Project?> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectByIdProviderElement extends AutoDisposeProviderElement<Project?>
    with ProjectByIdRef {
  _ProjectByIdProviderElement(super.provider);

  @override
  String get projectId => (origin as ProjectByIdProvider).projectId;
}

String _$projectsForVillageHash() =>
    r'8c622d10755739b1e715560a8d7bf709c4dfc760';

/// See also [projectsForVillage].
@ProviderFor(projectsForVillage)
const projectsForVillageProvider = ProjectsForVillageFamily();

/// See also [projectsForVillage].
class ProjectsForVillageFamily extends Family<List<Project>> {
  /// See also [projectsForVillage].
  const ProjectsForVillageFamily();

  /// See also [projectsForVillage].
  ProjectsForVillageProvider call(
    String villageName,
  ) {
    return ProjectsForVillageProvider(
      villageName,
    );
  }

  @override
  ProjectsForVillageProvider getProviderOverride(
    covariant ProjectsForVillageProvider provider,
  ) {
    return call(
      provider.villageName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectsForVillageProvider';
}

/// See also [projectsForVillage].
class ProjectsForVillageProvider extends AutoDisposeProvider<List<Project>> {
  /// See also [projectsForVillage].
  ProjectsForVillageProvider(
    String villageName,
  ) : this._internal(
          (ref) => projectsForVillage(
            ref as ProjectsForVillageRef,
            villageName,
          ),
          from: projectsForVillageProvider,
          name: r'projectsForVillageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectsForVillageHash,
          dependencies: ProjectsForVillageFamily._dependencies,
          allTransitiveDependencies:
              ProjectsForVillageFamily._allTransitiveDependencies,
          villageName: villageName,
        );

  ProjectsForVillageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.villageName,
  }) : super.internal();

  final String villageName;

  @override
  Override overrideWith(
    List<Project> Function(ProjectsForVillageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectsForVillageProvider._internal(
        (ref) => create(ref as ProjectsForVillageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        villageName: villageName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Project>> createElement() {
    return _ProjectsForVillageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectsForVillageProvider &&
        other.villageName == villageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, villageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectsForVillageRef on AutoDisposeProviderRef<List<Project>> {
  /// The parameter `villageName` of this provider.
  String get villageName;
}

class _ProjectsForVillageProviderElement
    extends AutoDisposeProviderElement<List<Project>>
    with ProjectsForVillageRef {
  _ProjectsForVillageProviderElement(super.provider);

  @override
  String get villageName => (origin as ProjectsForVillageProvider).villageName;
}

String _$projectSearchQueryHash() =>
    r'6630d27f66994054e85f02f734de32a47e8a5332';

/// See also [ProjectSearchQuery].
@ProviderFor(ProjectSearchQuery)
final projectSearchQueryProvider =
    AutoDisposeNotifierProvider<ProjectSearchQuery, String>.internal(
  ProjectSearchQuery.new,
  name: r'projectSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectSearchQuery = AutoDisposeNotifier<String>;
String _$projectFiltersNotifierHash() =>
    r'e0c4941e938b253f9df2a202c8ea53d10826082e';

/// See also [ProjectFiltersNotifier].
@ProviderFor(ProjectFiltersNotifier)
final projectFiltersNotifierProvider = AutoDisposeNotifierProvider<
    ProjectFiltersNotifier, ProjectFilters>.internal(
  ProjectFiltersNotifier.new,
  name: r'projectFiltersNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectFiltersNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectFiltersNotifier = AutoDisposeNotifier<ProjectFilters>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
