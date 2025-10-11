import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/models/project_model.dart';
import 'package:flutter_application_1/features/project_tracking/providers/project_provider.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProjectListScreen extends ConsumerWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProjectsAsync = ref.watch(allProjectsProvider);
    final filteredProjects = ref.watch(filteredProjectsProvider);
    final projectStats = ref.watch(projectStatsProvider);
    final searchQuery = ref.watch(projectSearchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context, ref),
          ),
          if (projectStats.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.analytics_outlined),
              onPressed: () => _showStatsDialog(context, projectStats),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              // To make the TextField controllable, we use a TextEditingController
              // that is managed outside or cleared when needed. For simplicity,
              // we can manage it here or just update the provider.
              onChanged: (value) =>
                  ref.read(projectSearchQueryProvider.notifier).setQuery(value),
              decoration: InputDecoration(
                hintText: 'Search projects by name or village...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          // This would require a controller to clear the text field visually
                          ref
                              .read(projectSearchQueryProvider.notifier)
                              .setQuery('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          if (projectStats.isNotEmpty) _QuickStatsHeader(stats: projectStats),
          _ActiveFiltersBar(),
          Expanded(
            child: allProjectsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) =>
                  Center(child: Text('Error loading projects: $err')),
              data: (_) {
                if (filteredProjects.isEmpty) {
                  return const Center(child: Text('No projects found.'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  itemCount: filteredProjects.length,
                  itemBuilder: (context, index) {
                    final project = filteredProjects[index];
                    return _ProjectCard(project: project);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context, WidgetRef ref) {
    final currentFilters = ref.read(projectFiltersNotifierProvider);

    ProjectStatus? tempStatus = currentFilters.status;
    ProjectCategory? tempCategory = currentFilters.category;
    ProjectPriority? tempPriority = currentFilters.priority;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Filter Projects'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<ProjectStatus?>(
                      value: tempStatus,
                      decoration: const InputDecoration(
                          labelText: 'Status', border: OutlineInputBorder()),
                      items: [
                        const DropdownMenuItem(
                            value: null, child: Text('All Statuses')),
                        ...ProjectStatus.values.map((s) => DropdownMenuItem(
                            value: s, child: Text(s.displayName))),
                      ],
                      onChanged: (value) =>
                          setDialogState(() => tempStatus = value),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<ProjectCategory?>(
                      value: tempCategory,
                      decoration: const InputDecoration(
                          labelText: 'Category', border: OutlineInputBorder()),
                      items: [
                        const DropdownMenuItem(
                            value: null, child: Text('All Categories')),
                        ...ProjectCategory.values.map((c) => DropdownMenuItem(
                            value: c, child: Text(c.displayName))),
                      ],
                      onChanged: (value) =>
                          setDialogState(() => tempCategory = value),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<ProjectPriority?>(
                      value: tempPriority,
                      decoration: const InputDecoration(
                          labelText: 'Priority', border: OutlineInputBorder()),
                      items: [
                        const DropdownMenuItem(
                            value: null, child: Text('All Priorities')),
                        ...ProjectPriority.values.map((p) => DropdownMenuItem(
                            value: p, child: Text(p.displayName))),
                      ],
                      onChanged: (value) =>
                          setDialogState(() => tempPriority = value),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    ref
                        .read(projectFiltersNotifierProvider.notifier)
                        .clearFilters();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Clear All'),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(projectFiltersNotifierProvider.notifier)
                        .setFilters(ProjectFilters(
                          status: tempStatus,
                          category: tempCategory,
                          priority: tempPriority,
                        ));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showStatsDialog(BuildContext context, Map<String, dynamic> stats) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Project Statistics'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatRow(
                  'Total Projects', stats['total']?.toString() ?? '0'),
              _buildStatRow('Completed', stats['completed']?.toString() ?? '0'),
              _buildStatRow('Ongoing', stats['ongoing']?.toString() ?? '0'),
              _buildStatRow('Delayed', stats['delayed']?.toString() ?? '0'),
              _buildStatRow('Pending', stats['pending']?.toString() ?? '0'),
              _buildStatRow('Overdue', stats['overdue']?.toString() ?? '0'),
              const Divider(),
              _buildStatRow('Total Budget',
                  '₹${NumberFormat('#,##,###').format(stats['totalBudget'] ?? 0)}'),
              _buildStatRow('Completion Rate',
                  '${(stats['completionRate'] ?? 0).toStringAsFixed(1)}%'),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close')),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// --- REFACTORED WIDGETS ---

class _ActiveFiltersBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(projectFiltersNotifierProvider);
    if (filters.status == null &&
        filters.category == null &&
        filters.priority == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.blue[50],
      child: Row(
        children: [
          const Icon(Icons.filter_alt, color: Colors.blue, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (filters.status != null)
                    Chip(label: Text(filters.status!.displayName)),
                  if (filters.category != null)
                    Chip(label: Text(filters.category!.displayName)),
                  if (filters.priority != null)
                    Chip(label: Text(filters.priority!.displayName)),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear, size: 18),
            onPressed: () => ref
                .read(projectFiltersNotifierProvider.notifier)
                .clearFilters(),
            tooltip: 'Clear All Filters',
          )
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => context.push('/projects/${project.id}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(project.category.icon,
                      color: AppTheme.primaryColor, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(project.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2),
                        Text(project.village,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _StatusChip(status: project.status),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${project.completionPercent}% Complete',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: project.completionPercent / 100,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                              project.status.color),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          '₹${NumberFormat('#,##,##0').format(project.budget)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        project.priority.displayName,
                        style: TextStyle(
                            color: project.priority.color,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    'Due: ${DateFormat('MMM dd, yyyy').format(project.expectedEndDate)}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const Spacer(),
                  if (project.isOverdue)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Text('Overdue',
                          style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final ProjectStatus status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: status.color.withOpacity(0.5)),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
            color: status.color, fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}

class _QuickStatsHeader extends StatelessWidget {
  final Map<String, dynamic> stats;
  const _QuickStatsHeader({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Total', stats['total']?.toString() ?? '0',
              Icons.assignment_outlined),
          _buildStatItem('Ongoing', stats['ongoing']?.toString() ?? '0',
              Icons.trending_up),
          _buildStatItem('Completed', stats['completed']?.toString() ?? '0',
              Icons.check_circle_outline),
          _buildStatItem('Delayed', stats['delayed']?.toString() ?? '0',
              Icons.warning_amber_rounded),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: 24),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
