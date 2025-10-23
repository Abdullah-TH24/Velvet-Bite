import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final Color color;
  const CustomIcon({super.key, this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xff01040F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Icon(icon, size: 30, color: color)),
    );
  }
}
