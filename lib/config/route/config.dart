import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutePaths {
  static String get onboarding => '/';
}

final rootNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigationKey,
  initialLocation: RoutePaths.onboarding,
  routes: [],
);
