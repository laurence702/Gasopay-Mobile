import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_wee/app.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      debugPrint(
        '${bloc.runtimeType} ${change.toString()} ${DateTime.now().toString()}',
      );
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Further initializations could go here... Hive...

  Bloc.observer = SimpleBlocObserver();
  runApp(const WeeApp());
}
