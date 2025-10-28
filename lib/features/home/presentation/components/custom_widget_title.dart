import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomWidgetTitle extends StatelessWidget {
  final String widgetTitle;
  final String buttonTitle;
  const CustomWidgetTitle({
    super.key,
    required this.widgetTitle,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widgetTitle, style: Theme.of(context).textTheme.bodySmall),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            overlayColor: AppColors.secondaryText,
            surfaceTintColor: AppColors.secondaryText,
          ),
          child: Text(
            buttonTitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.secondaryText),
          ),
        ),
      ],
    );
  }
}
