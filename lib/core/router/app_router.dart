import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/features/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/features/auth/screens/login_screen.dart';
import 'package:flutter_application_1/features/dashboard/screens/dashboard_screen.dart';
import 'package:flutter_application_1/features/dashboard/screens/home_screen.dart';
import 'package:flutter_application_1/features/feedback/screens/feedback_form_screen.dart';
import 'package:flutter_application_1/features/gis/screens/gis_tagging_screen.dart';
import 'package:flutter_application_1/features/project_tracking/screens/project_detail_screen.dart';
import 'package:flutter_application_1/features/project_tracking/screens/project_list_screen.dart';
import 'package:flutter_application_1/features/village_management/screens/district_list_screen.dart';
import 'package:flutter_application_1/features/village_management/screens/state_list_screen.dart';
import 'package:flutter_application_1/features/village_management/screens/village_detail_screen.dart';
import 'package:flutter_application_1/features/village_management/screens/village_list_screen.dart';
import 'package:flutter_application_1/features/assessment/screens/new_assessment_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_application_1/features/dashboard/screens/static_dashboard_screen.dart';
import 'package:flutter_application_1/features/chatbot/chatbot_screen.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = authState.role != UserRole.guest;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/home';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => DashboardScreen(child: child),
        routes: [
          GoRoute(
              path: '/home', builder: (context, state) => const HomeScreen()),
          GoRoute(
              path: '/states',
              builder: (context, state) => const StateListScreen()),
          GoRoute(
            path: '/projects',
            // FIX: Point to the 'enhanced' list screen
            builder: (context, state) => const ProjectListScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/districts/:stateName',
        builder: (context, state) {
          final stateName = state.pathParameters['stateName']!;
          return DistrictListScreen(stateName: stateName);
        },
      ),
      GoRoute(
        path: '/villages/:districtName',
        builder: (context, state) {
          final districtName = state.pathParameters['districtName']!;
          return VillageListScreen(districtName: districtName);
        },
      ),
      GoRoute(
        path: '/village-details/:id',
        builder: (context, state) {
          final villageId = state.pathParameters['id']!;
          return VillageDetailScreen(villageId: villageId);
        },
      ),
      GoRoute(
          path: '/schemes-dashboard',
          builder: (context, state) => const StaticDashboardScreen()),
      GoRoute(
        path: '/projects/:id',
        builder: (context, state) {
          final projectId = state.pathParameters['id']!;
          // FIX: Use the 'EnhancedProjectDetailScreen' class
          return ProjectDetailScreen(projectId: projectId);
        },
      ),
      GoRoute(
          path: '/feedback',
          builder: (context, state) => const FeedbackFormScreen()),
      GoRoute(
          path: '/gis-tagging',
          builder: (context, state) => const GisTaggingScreen()),
      GoRoute(
          path: '/new-assessment',
          builder: (context, state) => const NewAssessmentScreen()),
      GoRoute(
        path: '/chatbot',
        builder: (context, state) => const ChatbotScreen(),
      ),
    ],
  );
}
