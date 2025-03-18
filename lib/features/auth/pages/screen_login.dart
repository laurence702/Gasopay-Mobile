import 'package:flutter/material.dart';
import 'package:project_wee/constants/app_colors.dart';

import '../../../widgets/app_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                controller: TextEditingController(),
              ),
              const SizedBox(height: 10),
              AppTextField(
                label: 'Password',
                endIcon: Icons.key,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 40),
              // Password
              const AppButton(
                label: 'Login',
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onClick;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.label,
    this.onClick,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: (isLoading)
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}
