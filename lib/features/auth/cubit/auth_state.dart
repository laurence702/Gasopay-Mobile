part of 'rider_cubit.dart';

enum AuthStatus { initial, loading, loaded, error }

class AuthState<T> extends Equatable {
  final AuthStatus status;
  final String? message;
  final T? data;

  const AuthState({
    this.status = AuthStatus.initial,
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        status,
        data,
        message,
      ];

  AuthState copyWith({
    AuthStatus? status,
    T? data,
    String? message,
  }) =>
      AuthState(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );
}
