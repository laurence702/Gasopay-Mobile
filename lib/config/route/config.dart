import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_wee/features/rider/pages/screen_home.dart';
import 'package:project_wee/features/rider/pages/screen_settings.dart';

import '../../features/auth/pages/screen_login.dart';

class RoutePaths {
  static String get login => '/';
  static String get riderHome => '/rider/home';
  static String get riderSettings => '/rider/settings';
}

final rootNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigationKey,
  initialLocation: RoutePaths.login,
  routes: [
    GoRoute(
      parentNavigatorKey: rootNavigationKey,
      path: RoutePaths.login,
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigationKey,
      path: RoutePaths.riderHome,
      builder: (_, __) => const RiderHomeScreen(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigationKey,
      path: RoutePaths.riderSettings,
      builder: (_, __) => const RiderSettingsPage(),
    ),
  ],
);
