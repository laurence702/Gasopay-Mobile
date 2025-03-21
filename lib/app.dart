import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_wee/config/di/locator.dart';
import 'package:project_wee/config/theme/config.dart';
import 'package:project_wee/features/auth/cubit/auth_cubit.dart';
import 'package:toastification/toastification.dart';

import 'config/route/config.dart';

class WeeApp extends StatelessWidget {
  const WeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(getItInstance())),
      ],
      child: ToastificationWrapper(
        config: const ToastificationConfig(
          alignment: Alignment.bottomCenter,
          applyMediaQueryViewInsets: true,
          animationDuration: Duration(milliseconds: 150),
        ),
        child: MaterialApp.router(
          title: 'Gasopay',
          theme: AppTheme.light,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          backButtonDispatcher: router.backButtonDispatcher,
        ),
      ),
    );
  }
}
