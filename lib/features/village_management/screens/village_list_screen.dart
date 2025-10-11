import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/features/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/features/village_management/providers/village_filter_providers.dart';
import 'package:flutter_application_1/features/village_management/providers/village_providers.dart';

class VillageListScreen extends ConsumerStatefulWidget {
  final String districtName;
  const VillageListScreen({super.key, required this.districtName});

  @override
  ConsumerState<VillageListScreen> createState() => _VillageListScreenState();
}

class _VillageListScreenState extends ConsumerState<VillageListScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(villageSearchQueryProvider),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    // Clear the search query when leaving the screen
    ref.read(villageSearchQueryProvider.notifier).state = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    final searchQuery = ref.watch(villageSearchQueryProvider);
    // The provider now requires the districtName parameter
    final villagesAsync =
        ref.watch(villagesForDistrictProvider(widget.districtName));

    return Scaffold(
      appBar: AppBar(title: Text(widget.districtName)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a village in this district...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(villageSearchQueryProvider.notifier).state =
                              '';
                        },
                      )
                    : null,
              ),
              onChanged: (query) {
                ref.read(villageSearchQueryProvider.notifier).state = query;
              },
            ),
          ),
          Expanded(
            child: villagesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (villages) {
                if (villages.isEmpty) {
                  return const Center(child: Text('No villages found.'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: villages.length,
                  itemBuilder: (context, index) {
                    final village = villages[index];
                    return InkWell(
                      onTap: () =>
                          context.push('/village-details/${village.id}'),
                      borderRadius: BorderRadius.circular(12),
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: ListTile(
                          title: Text(village.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(village.block),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: user.role == UserRole.government
          ? FloatingActionButton(
              onPressed: () {
                // TODO: Implement adding a new village
              },
              child: const Icon(Icons.add))
          : null,
    );
  }
}
