import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF191A1F);
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFF02C543);
}

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.secondaryText,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondaryText,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.primaryText, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.primaryText, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.primaryText, fontSize: 15),
    titleLarge: TextStyle(
      color: AppColors.secondaryText,
      fontSize: 50,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: AppColors.secondaryText,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: AppColors.secondaryText,
      fontSize: 21,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryText,
      foregroundColor: AppColors.primaryText,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      fixedSize: const Size(double.infinity, 50),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xff01040F),
    enabledBorder: OutlineInputBorder(
      // borderSide: const BorderSide(color: AppColors.secondaryText),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      // borderSide: const BorderSide(color: AppColors.secondaryText, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
