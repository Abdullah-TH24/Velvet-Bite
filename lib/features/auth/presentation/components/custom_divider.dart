import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: Get.width / 2 - 40,
          color: AppColors.primaryText,
        ),
        const Text('or'),
        Container(
          height: 1,
          width: Get.width / 2 - 40,
          color: AppColors.primaryText,
        ),
      ],
    );
  }
}
