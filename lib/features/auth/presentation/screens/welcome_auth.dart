import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_divider.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_guide.dart';
import 'package:velvet_bite/features/auth/presentation/screens/data/welcome_auth_data.dart';

class WelcomeAuth extends StatelessWidget {
  const WelcomeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Gap(45),
            SvgPicture.asset('images/welcome-auth-image.svg', width: 250),
            const Gap(40),
            Center(
              child: Text(
                'Let’s You In',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: AppColors.primaryText),
              ),
            ),
            const Gap(15),
            ...List.generate(
              3,
              (index) => Container(
                height: 60,
                margin: const EdgeInsets.only(bottom: 21),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff01040F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (index == 1)
                        ? SvgPicture.asset(
                            'images/google-thumb.svg',
                            width: 27.5,
                          )
                        : authMethod[index].icon,
                    const Gap(10),
                    Text(
                      authMethod[index].title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const CustomDivider(),
            const Gap(10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ScreensRoutesNames.signIn);
              },
              child: Text(
                'Sign In with E-mail Account',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Gap(7.5),
            CustomGuide(
              leftText: 'Create a new account >',
              rightText: 'Sign Up',
              onPressed: () {
                Get.toNamed(ScreensRoutesNames.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
