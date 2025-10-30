import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final int order;
  final int currentOrder;
  final String text;
  final void Function()? onPressed;
  const CustomElevatedButton({
    super.key,
    required this.order,
    required this.currentOrder,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (order == currentOrder) ? onPressed : null,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(80, 20),
        padding: const EdgeInsets.all(5),
        disabledBackgroundColor: (order != currentOrder)
            ? const Color.fromRGBO(31, 33, 44, 1)
            : null,
        disabledForegroundColor: (order != currentOrder)
            ? AppColors.primaryText
            : null,
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
