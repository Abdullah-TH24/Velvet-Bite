import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ScreensRoutesNames.slidesScreen);
      },
      child: Container(
        width: Get.width / 2 - 10,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.secondaryText,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Row(
          children: [
            const Gap(2.5),
            Container(
              width: 47.5,
              height: 47.5,
              decoration: BoxDecoration(
                border: Border.all(width: 0.75, color: Colors.black26),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColors.primaryText,
              ),
            ),
            const Gap(10),
            Text(
              'Get Stated...!',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
