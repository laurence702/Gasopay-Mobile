import 'package:flutter/foundation.dart';
import 'package:project_wee/constants/test_data.dart';

import '../../model/user.dart';

class AuthService {
  Future<User> performSimulatedLogin(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      debugPrint(email);
      final Map<String, Object> user = testusers.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
        orElse: () => throw Exception('Incorrect login credentials'),
      );

      debugPrint(user.toString());

      final userCopy = Map<String, dynamic>.from(user);
      userCopy.remove('password'); // Remove password before returning
      debugPrint(userCopy.toString());
      return User.fromMap(userCopy);
    } catch (e) {
      debugPrint('Login error: $e');
      rethrow; // Rethrow the exception so the caller can handle it
    }
  }
}
