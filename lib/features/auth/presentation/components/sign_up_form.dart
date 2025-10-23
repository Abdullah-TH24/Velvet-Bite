import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_field.dart';
import 'package:velvet_bite/features/auth/presentation/components/password_icon.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_state.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required GlobalKey<FormState> signUp,
    required TextEditingController username,
    required TextEditingController email,
    required TextEditingController password,
  }) : _signUp = signUp,
       _username = username,
       _email = email,
       _password = password;

  final GlobalKey<FormState> _signUp;
  final TextEditingController _username;
  final TextEditingController _email;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUp,
      child: Column(
        children: [
          CustomField(
            controller: _username,
            icon: Icons.person_outline,
            text: 'Username',
            keyboardType: TextInputType.name,
          ),
          const Gap(21),
          CustomField(
            controller: _email,
            icon: Icons.email_outlined,
            text: 'E-mail',
            keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.visiblePassword,
              );
            },
          ),
        ],
      ),
    );
  }
}
