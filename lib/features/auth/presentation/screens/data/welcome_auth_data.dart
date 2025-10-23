import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/auth/data/models/welcome_auth_model.dart';

List<WelcomeAuthModel> authMethod = [
  WelcomeAuthModel(
    icon: const Icon(Icons.facebook, color: Color(0xff1877f2), size: 30),
    title: 'Continue with Facebook',
  ),
  WelcomeAuthModel(
    icon: const Icon(Icons.g_mobiledata_sharp, color: Colors.blue, size: 30),
    title: 'Continue with Google',
  ),
  WelcomeAuthModel(
    icon: const Icon(Icons.apple, color: AppColors.primaryText, size: 30),
    title: 'Continue with Apple',
  ),
];
