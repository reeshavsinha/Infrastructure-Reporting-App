import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/features/village_management/providers/village_providers.dart';

final stateSearchQueryProvider = StateProvider<String>((ref) => '');

class StateListScreen extends ConsumerWidget {
  const StateListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(stateSearchQueryProvider);
    final statesAsync = ref.watch(statesProvider);

    final filteredStates = statesAsync.whenOrNull(data: (states) {
          if (searchQuery.isEmpty) {
            return states;
          } else {
            return states
                .where((state) =>
                    state.toLowerCase().contains(searchQuery.toLowerCase()))
                .toList();
          }
        }) ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a State'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) =>
                  ref.read(stateSearchQueryProvider.notifier).state = value,
              decoration: InputDecoration(
                hintText: 'Search states...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => ref
                            .read(stateSearchQueryProvider.notifier)
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
      body: statesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (states) {
          if (filteredStates.isEmpty) {
            return const Center(child: Text('No states found.'));
          }
          return ListView.builder(
            itemCount: filteredStates.length,
            itemBuilder: (context, index) {
              final stateName = filteredStates[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(stateName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/districts/$stateName');
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
