part of 'rider_cubit.dart';

enum RiderStatus { initial, loading, loaded, error }

class RiderState<T> extends Equatable {
  final RiderStatus status;
  final String? message;
  final T? data;

  const RiderState({
    this.status = RiderStatus.initial,
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        status,
        data,
        message,
      ];

  RiderState copyWith({
    RiderStatus? status,
    T? data,
    String? message,
  }) =>
      RiderState(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );
}
