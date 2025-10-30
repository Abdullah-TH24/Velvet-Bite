import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomIcon extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  const CustomIcon({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: AppColors.secondaryText,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 15, color: AppColors.primaryText),
      ),
    );
  }
}
