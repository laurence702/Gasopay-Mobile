part of 'rider_cubit.dart';

enum AdminStatus { initial, loading, loaded, error }

class AdminState<T> extends Equatable {
  final AdminStatus status;
  final String? message;
  final T? data;

  const AdminState({
    this.status = AdminStatus.initial,
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        status,
        data,
        message,
      ];

  AdminState copyWith({
    AdminStatus? status,
    T? data,
    String? message,
  }) =>
      AdminState(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );
}
