import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomGuide extends StatelessWidget {
  final String leftText;
  final String rightText;
  final void Function()? onPressed;
  const CustomGuide({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(leftText, style: Theme.of(context).textTheme.bodySmall),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5),
            overlayColor: AppColors.secondaryText,
            surfaceTintColor: AppColors.secondaryText,
          ),
          child: Text(
            rightText,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.secondaryText),
          ),
        ),
      ],
    );
  }
}
