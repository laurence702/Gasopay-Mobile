import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_wee/features/auth/cubit/rider_cubit.dart';

import 'config/route/config.dart';

class WeeApp extends StatelessWidget {
  const WeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp.router(
        title: 'Gasopay',
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        backButtonDispatcher: router.backButtonDispatcher,
      ),
    );
  }
}
