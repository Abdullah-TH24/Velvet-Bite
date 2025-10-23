import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/auth/presentation/components/custom_icon.dart';

class SocialMethods extends StatelessWidget {
  const SocialMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomIcon(icon: Icons.facebook, color: Color(0xff1877f2)),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff01040F),
            borderRadius: BorderRadius.circular(8),
          ),
          width: 50,
          height: 50,
          child: Center(
            child: SvgPicture.asset('images/google-thumb.svg', width: 25),
          ),
        ),
        const CustomIcon(icon: Icons.apple, color: AppColors.primaryText),
      ],
    );
  }
}
