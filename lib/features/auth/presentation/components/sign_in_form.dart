import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_field.dart';
import 'package:velvet_bite/features/auth/presentation/components/password_icon.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required GlobalKey<FormState> signIn,
    required TextEditingController email,
    required TextEditingController password,
  }) : _signIn = signIn,
       _email = email,
       _password = password;

  final GlobalKey<FormState> _signIn;
  final TextEditingController _email;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signIn,
      child: Column(
        children: [
          CustomField(
            controller: _email,
            icon: Icons.email_outlined,
            text: 'E-mail Or Username',
          ),
          const Gap(21),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomField(
                controller: _password,
                text: 'Password',
                icon: Icons.lock_open_rounded,
                obscureText: !state.isPasswordVisible,
                suffixIcon: PasswordIcon(state: state),
              );
            },
          ),
        ],
      ),
    );
  }
}
