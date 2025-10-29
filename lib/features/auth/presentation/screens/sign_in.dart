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
import 'package:velvet_bite/features/auth/domain/contract_repositories/auth_repository.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:velvet_bite/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_divider.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_guide.dart';
import 'package:velvet_bite/features/auth/presentation/components/sign_in_form.dart';
import 'package:velvet_bite/features/auth/presentation/components/social_method.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velvet_bite/features/auth/presentation/cubit/auth_state.dart';
import 'package:velvet_bite/main.dart';

class SignIn extends StatelessWidget {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  SignIn({super.key, required this.signInUseCase, required this.signUpUseCase});

  final GlobalKey<FormState> _signIn = GlobalKey<FormState>();
  final TextEditingController _emailOrFullName = TextEditingController();
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
              const Gap(30),
              SvgPicture.asset('images/sign-in-image.svg', width: 200),
              const Gap(35),
              Center(
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              const Gap(25),
              SignInForm(
                signIn: _signIn,
                email: _emailOrFullName,
                password: _password,
              ),
              const Gap(35),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    log('Welcome ${state.user!.fullName}');
                    prefs.setBool('is_logged_in', true);
                    Get.offAllNamed(ScreensRoutesNames.dishes);
                  }
                  if (state is AuthError) {
                    Get.snackbar(
                      'Error',
                      state.message.substring(11).toString(),
                      duration: const Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.primaryText.withAlpha(100),
                      dismissDirection: DismissDirection.horizontal,
                      colorText: AppColors.primaryText,
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_emailOrFullName.text.endsWith('@gmail.com')) {
                        await context.read<AuthCubit>().signIn(
                          isPasswordVisible: state.isPasswordVisible,
                          emailOrFullName: _emailOrFullName.text.trim(),
                          type: UserType.email,
                          password: _password.text.trim(),
                        );
                      } else {
                        await context.read<AuthCubit>().signIn(
                          isPasswordVisible: state.isPasswordVisible,
                          emailOrFullName: _emailOrFullName.text.trim(),
                          type: UserType.fullName,
                          password: _password.text.trim(),
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
                        : const Text('Sign In'),
                  );
                },
              ),
              const Gap(10),
              const CustomDivider(),
              const Gap(10),
              const SocialMethods(),
              CustomGuide(
                leftText: 'Create a new account >',
                rightText: 'Sign Up',
                onPressed: () {
                  Get.offNamed(ScreensRoutesNames.signUp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
