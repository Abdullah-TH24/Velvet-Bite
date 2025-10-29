import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class CustomShape extends StatelessWidget {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final double size;
  const CustomShape({
    super.key,
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: Transform.rotate(
        angle: 50,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryText.withAlpha(111),
          ),
        ),
      ),
    );
  }
}
