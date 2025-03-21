import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData? endIcon;
  const AppTextField({
    super.key,
    this.label,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: (endIcon != null) ? Icon(endIcon) : null,
            ),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
