import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // FIX: Added missing import for context.push()
import 'package:flutter_application_1/core/models/project_model.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:flutter_application_1/features/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/features/project_tracking/providers/project_provider.dart';
import 'package:flutter_application_1/features/village_management/models/village_model.dart';
import 'package:flutter_application_1/features/village_management/providers/village_providers.dart';
import 'package:flutter_application_1/shared/widgets/status_tag.dart';
import 'package:intl/intl.dart';

class VillageDetailScreen extends ConsumerWidget {
  final String villageId;
  const VillageDetailScreen({super.key, required this.villageId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final villageAsync = ref.watch(villageDetailsProvider(villageId));

    return villageAsync.when(
      loading: () => Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator())),
      error: (err, stack) =>
          Scaffold(appBar: AppBar(), body: Center(child: Text('Error: $err'))),
      data: (village) {
        if (user.role == UserRole.government) {
          return _GovVillageDetailView(village: village);
        } else {
          return _CivilianVillageDetailView(village: village);
        }
      },
    );
  }
}

// --- GOVERNMENT VIEW WIDGET ---
class _GovVillageDetailView extends StatelessWidget {
  final Village village;
  const _GovVillageDetailView({required this.village});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(village.name),
          bottom: const TabBar(
            isScrollable: false,
            tabs: [
              Tab(icon: Icon(Icons.info_outline), text: 'Overview'),
              Tab(icon: Icon(Icons.playlist_add_check), text: 'Assessment'),
              Tab(icon: Icon(Icons.account_tree_outlined), text: 'Projects'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _OverviewTab(village: village),
            _AssessmentTab(village: village),
            _ProjectsTab(village: village),
          ],
        ),
      ),
    );
  }
}

// --- TAB 1: OVERVIEW ---
class _OverviewTab extends StatelessWidget {
  final Village village;
  const _OverviewTab({required this.village});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Geographic Details',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const Divider(height: 24),
              _InfoRow(label: 'Block', value: village.block),
              _InfoRow(label: 'District', value: village.district),
              _InfoRow(label: 'State', value: village.state),
            ],
          ),
        )),
        const SizedBox(height: 16),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Demographics',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const Divider(height: 24),
              _InfoRow(
                  label: 'Population',
                  value: NumberFormat('#,##0').format(village.population)),
            ],
          ),
        )),
      ],
    );
  }
}

// --- TAB 2: INFRASTRUCTURE ASSESSMENT ---
class _AssessmentTab extends ConsumerStatefulWidget {
  final Village village;
  const _AssessmentTab({required this.village});

  @override
  ConsumerState<_AssessmentTab> createState() => _AssessmentTabState();
}

class _AssessmentTabState extends ConsumerState<_AssessmentTab> {
  late Map<String, String> _currentStatuses;

  @override
  void initState() {
    super.initState();
    _currentStatuses = {
      for (var status in widget.village.infrastructureStatus)
        status.domain: status.value
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ..._currentStatuses.entries.map((entry) {
          final domain = entry.key;
          final statusValue = entry.value;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(domain,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: StatusTag(status: statusValue),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Completed'),
                        value: 'Completed',
                        groupValue: statusValue,
                        onChanged: (val) =>
                            setState(() => _currentStatuses[domain] = val!),
                      ),
                      RadioListTile<String>(
                        title: const Text('In Progress'),
                        value: 'In_Progress',
                        groupValue: statusValue,
                        onChanged: (val) =>
                            setState(() => _currentStatuses[domain] = val!),
                      ),
                      RadioListTile<String>(
                        title: const Text('Not Started'),
                        value: 'Not_Started',
                        groupValue: statusValue,
                        onChanged: (val) =>
                            setState(() => _currentStatuses[domain] = val!),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {}, child: const Text('Add Photo')),
                          const SizedBox(width: 8),
                          ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('$domain status updated!'),
                                      backgroundColor: AppTheme.successColor),
                                );
                              },
                              child: const Text('Save')),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

// --- TAB 3: PROJECTS ---
// FIX: Changed from StatelessWidget to ConsumerWidget
class _ProjectsTab extends ConsumerWidget {
  final Village village;
  const _ProjectsTab({required this.village});

  @override
  // FIX: Added WidgetRef ref parameter
  Widget build(BuildContext context, WidgetRef ref) {
    // This line will now work correctly
    final projectsForVillage =
        ref.watch(projectsForVillageProvider(village.name));

    return Scaffold(
      body: projectsForVillage.isEmpty
          ? const Center(child: Text('No projects found for this village.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: projectsForVillage.length,
              itemBuilder: (context, index) {
                final project = projectsForVillage[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(project.name),
                    subtitle: Text('Status: ${project.status.displayName}'),
                    trailing: Text('${project.completionPercent}%'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add New Project'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

// --- CIVILIAN VIEW WIDGET ---
// FIX: Changed from StatelessWidget to ConsumerWidget
class _CivilianVillageDetailView extends ConsumerWidget {
  final Village village;
  const _CivilianVillageDetailView({required this.village});

  @override
  // FIX: Added WidgetRef ref parameter
  Widget build(BuildContext context, WidgetRef ref) {
    // This line will now work correctly
    final projectsForVillage =
        ref.watch(projectsForVillageProvider(village.name));

    return Scaffold(
      appBar: AppBar(title: Text(village.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(village.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${village.district}, ${village.state}'),
                  const Divider(height: 32),
                  const Text('Infrastructure Status',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  ...village.infrastructureStatus.map((status) => ListTile(
                        leading: Icon(Icons.circle,
                            color: status.value == 'Completed'
                                ? AppTheme.successColor
                                : (status.value == 'In_Progress'
                                    ? AppTheme.warningColor
                                    : AppTheme.dangerColor),
                            size: 12),
                        title: Text(status.domain,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        trailing: StatusTag(status: status.value),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Associated Projects',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (projectsForVillage.isEmpty)
            const Card(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                        'No projects are currently active in this village.')))
          else
            ...projectsForVillage.map(
              (project) => Card(
                child: ListTile(
                  title: Text(project.name),
                  subtitle: Text('Status: ${project.status.displayName}'),
                  trailing: const Icon(Icons.chevron_right),
                  // This line will now work correctly
                  onTap: () => context.push('/projects/${project.id}'),
                ),
              ),
            )
        ],
      ),
    );
  }
}

// --- HELPER WIDGETS ---
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 120,
              child: Text('$label:',
                  style: const TextStyle(color: Colors.black54))),
          Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
