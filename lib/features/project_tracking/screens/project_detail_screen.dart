import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/core/models/project_model.dart';
import 'package:flutter_application_1/features/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/features/project_tracking/providers/project_provider.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
//import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProjectDetailScreen extends ConsumerWidget {
  final String projectId;
  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final project = ref.watch(projectByIdProvider(projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(project?.name ?? 'Project Not Found'),
        actions: [
          if (user.role == UserRole.government && project != null)
            IconButton(
              icon: const Icon(Icons.edit_note_outlined),
              onPressed: () => _showEditProjectDialog(context, ref, project),
              tooltip: 'Edit Project',
            ),
        ],
      ),
      body: project == null
          ? const Center(child: Text('Project not found.'))
          : (user.role == UserRole.government
              ? _GovProjectDetailView(project: project)
              : _CivilianProjectDetailView(project: project)),
    );
  }

  void _showEditProjectDialog(
      BuildContext context, WidgetRef ref, Project project) {
    final nameController = TextEditingController(text: project.name);
    final descriptionController =
        TextEditingController(text: project.description);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Project Details'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Project Name', border: OutlineInputBorder()),
                  validator: (value) =>
                      (value?.isEmpty ?? true) ? 'Name cannot be empty' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true),
                  maxLines: 5,
                  validator: (value) => (value?.isEmpty ?? true)
                      ? 'Description cannot be empty'
                      : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // In a real app, you would call a repository to update the data
                // ref.read(projectRepositoryProvider).updateProject(...);

                // For this prototype, we invalidate the provider to simulate a refresh
                ref.invalidate(allProjectsProvider);

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Project details saved! (Simulation)'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// --- GOVERNMENT (EDITABLE) VIEW ---
class _GovProjectDetailView extends ConsumerStatefulWidget {
  final Project project;
  const _GovProjectDetailView({required this.project});

  @override
  ConsumerState<_GovProjectDetailView> createState() =>
      _GovProjectDetailViewState();
}

class _GovProjectDetailViewState extends ConsumerState<_GovProjectDetailView> {
  late ProjectStatus _currentStatus;
  late int _currentCompletion;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.project.status;
    _currentCompletion = widget.project.completionPercent;
    _notesController = TextEditingController(text: widget.project.notes);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _saveProgress() {
    // In a real app, this would call a repository and then invalidate providers
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Progress for "${widget.project.name}" saved. (Simulation)'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectOverviewCard(project: widget.project),
          const SizedBox(height: 16),
          _ProjectDetailsCard(project: widget.project),
          const SizedBox(height: 16),
          _FinancialCard(project: widget.project),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Update Progress',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<ProjectStatus>(
                    value: _currentStatus,
                    decoration: const InputDecoration(
                        labelText: 'Project Status',
                        border: OutlineInputBorder()),
                    items: ProjectStatus.values
                        .map((status) => DropdownMenuItem(
                            value: status, child: Text(status.displayName)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _currentStatus = value!),
                  ),
                  const SizedBox(height: 24),
                  Text('Progress: $_currentCompletion%'),
                  Slider(
                    value: _currentCompletion.toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '$_currentCompletion%',
                    onChanged: (value) =>
                        setState(() => _currentCompletion = value.round()),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _notesController,
                    decoration: const InputDecoration(
                        labelText: 'Progress Notes',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt_outlined),
                              label: const Text('Upload Photo'))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: ElevatedButton.icon(
                              onPressed: _saveProgress,
                              icon: const Icon(Icons.save),
                              label: const Text('Save'))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- CIVILIAN (READ-ONLY) VIEW ---
class _CivilianProjectDetailView extends StatelessWidget {
  final Project project;
  const _CivilianProjectDetailView({required this.project});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectOverviewCard(project: project),
          const SizedBox(height: 16),
          _ProjectDetailsCard(project: project),
          const SizedBox(height: 16),
          _FinancialCard(project: project),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Photo Gallery',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_library_outlined,
                              size: 48, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('Photos uploaded by officials appear here',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- SHARED DETAIL WIDGETS ---

class _ProjectOverviewCard extends StatelessWidget {
  final Project project;
  const _ProjectOverviewCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(project.village,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey[600])),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(project.description,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _ProjectDetailsCard extends StatelessWidget {
  final Project project;
  const _ProjectDetailsCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Details',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _InfoRow(label: 'Category', value: project.category.displayName),
            _InfoRow(label: 'Priority', value: project.priority.displayName),
            _InfoRow(label: 'Status', value: project.status.displayName),
            _InfoRow(label: 'Progress', value: '${project.completionPercent}%'),
            _InfoRow(
                label: 'Last Updated',
                value: DateFormat('MMM dd, yyyy').format(project.lastUpdated)),
            _InfoRow(
                label: 'Start Date',
                value: DateFormat('MMM dd, yyyy').format(project.startDate)),
            _InfoRow(
                label: 'Due Date',
                value:
                    DateFormat('MMM dd, yyyy').format(project.expectedEndDate)),
          ],
        ),
      ),
    );
  }
}

class _FinancialCard extends StatelessWidget {
  final Project project;
  const _FinancialCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Financials',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _InfoRow(
                label: 'Total Budget',
                value: '₹${NumberFormat('#,##,##0').format(project.budget)}'),
            _InfoRow(
                label: 'Allocated',
                value:
                    '₹${NumberFormat('#,##,##0').format(project.allocatedBudget)}'),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 120,
              child: Text('$label:',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54))),
          Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
