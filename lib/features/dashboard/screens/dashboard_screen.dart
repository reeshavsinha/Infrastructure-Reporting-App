import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  const DashboardScreen({super.key, required this.child});

  // FIX: Updated logic to correctly highlight the active tab for the new drill-down routes
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    // If the path starts with any of these, the "Villages" tab is active.
    if (location.startsWith('/states') ||
        location.startsWith('/districts') ||
        location.startsWith('/villages')) {
      return 1;
    }
    if (location.startsWith('/projects')) {
      return 2;
    }
    // Default to the Home tab
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        // FIX: The "Villages" tab now navigates to the list of states.
        context.go('/states');
        break;
      case 2:
        context.go('/projects');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.holiday_village_outlined),
            activeIcon: Icon(Icons.holiday_village),
            label: 'Villages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            activeIcon: Icon(Icons.account_tree),
            label: 'Projects',
          ),
        ],
      ),
    );
  }
}
