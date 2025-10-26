import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:velvet_bite/features/splash/presentation/cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        Future.delayed(const Duration(seconds: 3), () async {
          if (state is NavigateToWelcome) {
            Get.offNamed(ScreensRoutesNames.welcomeScreen);
          } else if (state is NavigateToWelcomeAuth) {
            Get.offNamed(ScreensRoutesNames.welcomeAuthScreen);
          } else if (state is NavigateToHome) {
            Get.offNamed(ScreensRoutesNames.home);
          }
        });
      },
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const Gap(160),
                Center(child: SvgPicture.asset('images/Logo.svg')),
                const Gap(200),
                const SpinKitFadingCircle(
                  color: AppColors.secondaryText,
                  size: 50.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
