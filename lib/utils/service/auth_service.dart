import 'package:flutter/foundation.dart';
import 'package:project_wee/constants/test_data.dart';

import '../../model/user.dart';

class AuthService {
  performSimulatedLogin(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final user = testusers.firstWhere(
          (u) => u['email'] == email && u['password'] == password,
          orElse: () => {});

      if (user.isNotEmpty) {
        return User.fromMap(user..remove('password'));
      } else {
        throw Exception('Incorrect login credentails');
      }
    } catch (e) {
      debugPrint('Login error: $e');
    }
  }
}
