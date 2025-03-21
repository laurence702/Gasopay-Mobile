import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_wee/config/route/config.dart';
import 'package:project_wee/utils/service/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _service;
  AuthCubit(this._service) : super(const AuthState());

  Future<void> login({required String userID, required String password}) async {
    emit(state.copyWith(status: AuthStatus.loading));
    debugPrint('email -> $userID');

    try {
      final user = await _service.performSimulatedLogin(
          email: userID, password: password);

      emit(state.copyWith(
        data: user,
        message: 'User login successful!',
        status: AuthStatus.success,
      ));
      switch (user.role) {
        case 'rider':
          router.go(RoutePaths.riderHome);
      }
    } on Exception catch (_, e) {
      emit(state.copyWith(
        message: 'An error occurred: ${e.toString()}',
        status: AuthStatus.error,
      ));
    }
  }
}
