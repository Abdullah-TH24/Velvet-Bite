// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_divider.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_guide.dart';
import 'package:velvet_bite/features/auth/presentation/components/sign_up_form.dart';
import 'package:velvet_bite/features/auth/presentation/components/social_method.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_state.dart';

class SignUp extends StatelessWidget {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  SignUp({super.key, required this.signInUseCase, required this.signUpUseCase});

  final GlobalKey<FormState> _signUp = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(signInUseCase: signInUseCase, signUpUseCase: signUpUseCase),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.close(1);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryText,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const Gap(10),
              SvgPicture.asset('images/sign-up-image.svg', width: 200),
              const Gap(20),
              Center(
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              const Gap(10),
              SignUpForm(
                signUp: _signUp,
                username: _username,
                email: _email,
                password: _password,
              ),
              const Gap(25),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      await context.read<AuthCubit>().signUp(
                        isPasswordVisible: state.isPasswordVisible,
                        email: _email.text.trim(),
                        fullName: _username.text.trim(),
                        password: _password.text.trim(),
                      );
                      if (state is AuthSuccess) {
                        log('Welcome');
                        Get.offNamed(ScreensRoutesNames.signIn);
                      } else if (state is AuthError) {
                        Get.snackbar(
                          'Error',
                          state.message.substring(11).toString(),
                          duration: const Duration(seconds: 3),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.primaryText.withAlpha(100),
                          dismissDirection: DismissDirection.horizontal,
                          colorText: AppColors.background,
                        );
                      }
                    },
                    child: (state is AuthLoading)
                        ? const Padding(
                            padding: EdgeInsets.all(5),
                            child: SpinKitDoubleBounce(
                              color: AppColors.primaryText,
                            ),
                          )
                        : const Text('Sign Up'),
                  );
                },
              ),
              const Gap(10),
              const CustomDivider(),
              const Gap(10),
              const SocialMethods(),
              CustomGuide(
                leftText: 'Already having an account? >',
                rightText: 'Sign In',
                onPressed: () {
                  Get.toNamed(ScreensRoutesNames.signIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
