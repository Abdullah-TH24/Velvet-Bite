import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String text;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  const CustomField({
    super.key,
    required this.controller,
    required this.icon,
    required this.text,
    this.suffixIcon,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: Icon(icon, color: AppColors.primaryText),
        hint: Text(text, style: Theme.of(context).textTheme.bodySmall),
        filled: true,
        fillColor: const Color(0xff01040F),
        suffixIcon: suffixIcon,
      ),
      cursorColor: AppColors.primaryText.withAlpha(123),
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodySmall,
      obscureText: obscureText,
    );
  }
}
