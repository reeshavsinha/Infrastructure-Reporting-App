import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:flutter_application_1/features/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/features/dashboard/providers/dashboard_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.role == UserRole.government
            ? 'Management Dashboard'
            : 'Public Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
          )
        ],
      ),
      body: user.role == UserRole.government
          ? _buildGovernmentDashboard(context, ref)
          : _buildCivilianDashboard(context, ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/chatbot'),
        child: const Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}

// --- CIVILIAN DASHBOARD ---
// FIX: Added WidgetRef ref and made the Success Stories list dynamic
Widget _buildCivilianDashboard(BuildContext context, WidgetRef ref) {
  final stories = ref.watch(successStoriesProvider);

  return ListView(
    padding: const EdgeInsets.all(16.0),
    children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('11,452',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Adarsh Grams Declared Nationally')
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      ElevatedButton.icon(
        icon: const Icon(Icons.feedback_outlined),
        label: const Text('Report an Issue / Give Feedback'),
        onPressed: () => context.push('/feedback'),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16)),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.article_outlined),
        label: const Text('View Government Schemes'),
        onPressed: () => context.push('/schemes-dashboard'),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16)),
      ),
      const SizedBox(height: 24),
      Text('Success Stories', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),

      // FIX: Dynamically build the list from the provider
      ...stories.map((story) => Card(
            child: ListTile(
              title: Text(story.title),
              subtitle: Text(story.subtitle),
            ),
          )),
    ],
  );
}

// --- GOVERNMENT DASHBOARD ---
Widget _buildGovernmentDashboard(BuildContext context, WidgetRef ref) {
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Text('Welcome, ${ref.read(authProvider).name}',
          style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 16),
      Card(
        color: AppTheme.warningColor.withOpacity(0.1),
        child: ListTile(
          leading: const Icon(Icons.warning_amber_rounded,
              color: AppTheme.warningColor),
          title: const Text('3 Project Updates Due'),
          subtitle: const Text('Tap to view pending tasks'),
          onTap: () => context.push(
              '/projects?status=Ongoing'), // Link to projects with ongoing status
        ),
      ),
      const SizedBox(height: 24),
      Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 16),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
        children: [
          _QuickAccessCard(
              icon: Icons.playlist_add_check,
              label: 'Start New Assessment',
              color: AppTheme.primaryColor,
              onTap: () => context.push('/new-assessment')),
          _QuickAccessCard(
              icon: Icons.edit_note,
              label: 'Update Project Status',
              color: AppTheme.infoColor,
              onTap: () => context.push('/projects')),
          _QuickAccessCard(
              icon: Icons.add_location_alt,
              label: 'Tag New Asset (GIS)',
              color: AppTheme.successColor,
              onTap: () => context.push('/gis-tagging')),
          _QuickAccessCard(
              icon: Icons.add_comment,
              label: 'View Feedback',
              color: AppTheme.dangerColor,
              onTap: () {
                // TODO: Implement navigation to a feedback viewing screen
                context.push('/feedback');
              }),
          _QuickAccessCard(
              icon: Icons.article_outlined,
              label: 'Government Schemes',
              color: AppTheme.accentColor,
              onTap: () => context.push('/schemes-dashboard')),
        ],
      ),
    ],
  );
}

// Helper widget for Government Dashboard
class _QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _QuickAccessCard(
      {required this.icon,
      required this.label,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 12),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
