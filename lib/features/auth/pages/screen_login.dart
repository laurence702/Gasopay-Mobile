import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_textfield.dart';
import '../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        //
        if (state.status == AuthStatus.error) {
          toastification.show(
            title: Text(state.message!),
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 2),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome to Gasopay',
                    style: TextStyle(
                      fontSize: 8 * 3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Some kind of long message can go here to describe the page',
                    style: TextStyle(
                      fontSize: 8 * 2,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email
                  AppTextField(
                    label: 'Email',
                    endIcon: Icons.mail_outline_rounded,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    label: 'Password',
                    endIcon: Icons.key,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 40),
                  // Password
                  AppButton(
                    label: 'Login',
                    onClick: _onLoginPressed,
                    isLoading: state.status == AuthStatus.loading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _onLoginPressed() {
    debugPrint('emailController --> ${_emailController.text}');
    // Validate fields
    context.read<AuthCubit>().login(
          userID: _emailController.text,
          password: _passwordController.text,
        );
  }
}
