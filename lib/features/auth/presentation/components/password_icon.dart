import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_state.dart';

class PasswordIcon extends StatelessWidget {
  final AuthState state;
  const PasswordIcon({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AuthCubit>().togglePasswordVisibility();
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        ),
        child: Icon(
          (state.isPasswordVisible)
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          key: ValueKey<bool>(state.isPasswordVisible),
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}
