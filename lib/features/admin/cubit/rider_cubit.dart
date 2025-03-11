import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rider_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(const AdminState());
}
