// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statesHash() => r'414c8a8ff62fd33d7032c8bff682df9bd3ed2ec9';

/// See also [states].
@ProviderFor(states)
final statesProvider = AutoDisposeFutureProvider<List<String>>.internal(
  states,
  name: r'statesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$statesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StatesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$districtsForStateHash() => r'025358b9ca7a431a83e4221e562ddefcffd28102';

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

/// See also [districtsForState].
@ProviderFor(districtsForState)
const districtsForStateProvider = DistrictsForStateFamily();

/// See also [districtsForState].
class DistrictsForStateFamily extends Family<AsyncValue<List<String>>> {
  /// See also [districtsForState].
  const DistrictsForStateFamily();

  /// See also [districtsForState].
  DistrictsForStateProvider call(
    String stateName,
  ) {
    return DistrictsForStateProvider(
      stateName,
    );
  }

  @override
  DistrictsForStateProvider getProviderOverride(
    covariant DistrictsForStateProvider provider,
  ) {
    return call(
      provider.stateName,
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
  String? get name => r'districtsForStateProvider';
}

/// See also [districtsForState].
class DistrictsForStateProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [districtsForState].
  DistrictsForStateProvider(
    String stateName,
  ) : this._internal(
          (ref) => districtsForState(
            ref as DistrictsForStateRef,
            stateName,
          ),
          from: districtsForStateProvider,
          name: r'districtsForStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$districtsForStateHash,
          dependencies: DistrictsForStateFamily._dependencies,
          allTransitiveDependencies:
              DistrictsForStateFamily._allTransitiveDependencies,
          stateName: stateName,
        );

  DistrictsForStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stateName,
  }) : super.internal();

  final String stateName;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(DistrictsForStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DistrictsForStateProvider._internal(
        (ref) => create(ref as DistrictsForStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stateName: stateName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _DistrictsForStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DistrictsForStateProvider && other.stateName == stateName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stateName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DistrictsForStateRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `stateName` of this provider.
  String get stateName;
}

class _DistrictsForStateProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with DistrictsForStateRef {
  _DistrictsForStateProviderElement(super.provider);

  @override
  String get stateName => (origin as DistrictsForStateProvider).stateName;
}

String _$villagesForDistrictHash() =>
    r'12d6b1e81964c3e1463ad46d0f0595cf21eb13a9';

/// See also [villagesForDistrict].
@ProviderFor(villagesForDistrict)
const villagesForDistrictProvider = VillagesForDistrictFamily();

/// See also [villagesForDistrict].
class VillagesForDistrictFamily extends Family<AsyncValue<List<Village>>> {
  /// See also [villagesForDistrict].
  const VillagesForDistrictFamily();

  /// See also [villagesForDistrict].
  VillagesForDistrictProvider call(
    String districtName,
  ) {
    return VillagesForDistrictProvider(
      districtName,
    );
  }

  @override
  VillagesForDistrictProvider getProviderOverride(
    covariant VillagesForDistrictProvider provider,
  ) {
    return call(
      provider.districtName,
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
  String? get name => r'villagesForDistrictProvider';
}

/// See also [villagesForDistrict].
class VillagesForDistrictProvider
    extends AutoDisposeFutureProvider<List<Village>> {
  /// See also [villagesForDistrict].
  VillagesForDistrictProvider(
    String districtName,
  ) : this._internal(
          (ref) => villagesForDistrict(
            ref as VillagesForDistrictRef,
            districtName,
          ),
          from: villagesForDistrictProvider,
          name: r'villagesForDistrictProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$villagesForDistrictHash,
          dependencies: VillagesForDistrictFamily._dependencies,
          allTransitiveDependencies:
              VillagesForDistrictFamily._allTransitiveDependencies,
          districtName: districtName,
        );

  VillagesForDistrictProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.districtName,
  }) : super.internal();

  final String districtName;

  @override
  Override overrideWith(
    FutureOr<List<Village>> Function(VillagesForDistrictRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VillagesForDistrictProvider._internal(
        (ref) => create(ref as VillagesForDistrictRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        districtName: districtName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Village>> createElement() {
    return _VillagesForDistrictProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VillagesForDistrictProvider &&
        other.districtName == districtName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, districtName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VillagesForDistrictRef on AutoDisposeFutureProviderRef<List<Village>> {
  /// The parameter `districtName` of this provider.
  String get districtName;
}

class _VillagesForDistrictProviderElement
    extends AutoDisposeFutureProviderElement<List<Village>>
    with VillagesForDistrictRef {
  _VillagesForDistrictProviderElement(super.provider);

  @override
  String get districtName =>
      (origin as VillagesForDistrictProvider).districtName;
}

String _$villageDetailsHash() => r'a42abb7ac0eb25cbf624234951155fddd2175402';

/// See also [villageDetails].
@ProviderFor(villageDetails)
const villageDetailsProvider = VillageDetailsFamily();

/// See also [villageDetails].
class VillageDetailsFamily extends Family<AsyncValue<Village>> {
  /// See also [villageDetails].
  const VillageDetailsFamily();

  /// See also [villageDetails].
  VillageDetailsProvider call(
    String villageId,
  ) {
    return VillageDetailsProvider(
      villageId,
    );
  }

  @override
  VillageDetailsProvider getProviderOverride(
    covariant VillageDetailsProvider provider,
  ) {
    return call(
      provider.villageId,
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
  String? get name => r'villageDetailsProvider';
}

/// See also [villageDetails].
class VillageDetailsProvider extends AutoDisposeFutureProvider<Village> {
  /// See also [villageDetails].
  VillageDetailsProvider(
    String villageId,
  ) : this._internal(
          (ref) => villageDetails(
            ref as VillageDetailsRef,
            villageId,
          ),
          from: villageDetailsProvider,
          name: r'villageDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$villageDetailsHash,
          dependencies: VillageDetailsFamily._dependencies,
          allTransitiveDependencies:
              VillageDetailsFamily._allTransitiveDependencies,
          villageId: villageId,
        );

  VillageDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.villageId,
  }) : super.internal();

  final String villageId;

  @override
  Override overrideWith(
    FutureOr<Village> Function(VillageDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VillageDetailsProvider._internal(
        (ref) => create(ref as VillageDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        villageId: villageId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Village> createElement() {
    return _VillageDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VillageDetailsProvider && other.villageId == villageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, villageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VillageDetailsRef on AutoDisposeFutureProviderRef<Village> {
  /// The parameter `villageId` of this provider.
  String get villageId;
}

class _VillageDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Village> with VillageDetailsRef {
  _VillageDetailsProviderElement(super.provider);

  @override
  String get villageId => (origin as VillageDetailsProvider).villageId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
