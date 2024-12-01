import 'package:flutter/material.dart';
import 'package:scoref_manager/core/ui/colors/color.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary500,
      scaffoldBackgroundColor: AppColors.primary50,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.primary50,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary500,
        onPrimary: AppColors.primary50,
        secondary: AppColors.primary700,
        onSecondary: AppColors.primary50,
        surface: AppColors.primary100,
        onSurface: AppColors.primary900,
        error: Colors.red,
        onError: AppColors.primary50,
      ),
      textTheme: const TextTheme(),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary500,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary700,
      scaffoldBackgroundColor: AppColors.primary900,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary900,
        foregroundColor: AppColors.primary50,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary700,
        onPrimary: AppColors.primary50,
        secondary: AppColors.primary500,
        onSecondary: AppColors.primary50,
        surface: AppColors.primary800,
        onSurface: AppColors.primary50,
        error: Colors.redAccent,
        onError: AppColors.primary50,
      ),
      textTheme: const TextTheme(),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary700,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
