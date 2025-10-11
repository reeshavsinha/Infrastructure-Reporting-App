import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/features/village_management/providers/village_providers.dart';

final districtSearchQueryProvider = StateProvider<String>((ref) => '');

class DistrictListScreen extends ConsumerWidget {
  final String stateName;
  const DistrictListScreen({super.key, required this.stateName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(districtSearchQueryProvider);
    final districtsAsync = ref.watch(districtsForStateProvider(stateName));

    final filteredDistricts = districtsAsync.whenOrNull(data: (districts) {
          if (searchQuery.isEmpty) {
            return districts;
          } else {
            return districts
                .where((district) =>
                    district.toLowerCase().contains(searchQuery.toLowerCase()))
                .toList();
          }
        }) ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: Text(stateName),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) =>
                  ref.read(districtSearchQueryProvider.notifier).state = value,
              decoration: InputDecoration(
                hintText: 'Search districts...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => ref
                            .read(districtSearchQueryProvider.notifier)
                            .state = '',
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ),
      body: districtsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (districts) {
          if (filteredDistricts.isEmpty) {
            return const Center(child: Text('No districts found.'));
          }
          return ListView.builder(
            itemCount: filteredDistricts.length,
            itemBuilder: (context, index) {
              final districtName = filteredDistricts[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(districtName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/villages/$districtName');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
