import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/pages/screen_login.dart';

class RoutePaths {
  static String get login => '/';
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
  ],
);
