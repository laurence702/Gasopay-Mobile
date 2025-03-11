import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rider_state.dart';

class RiderCubit extends Cubit<RiderState> {
  RiderCubit() : super(const RiderState());
}
