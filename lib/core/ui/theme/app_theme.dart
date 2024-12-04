import 'package:flutter/material.dart';
import 'package:scoref_manager/core/ui/colors/color.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
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
        error: AppColors.error,
        onError: AppColors.primary50,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 250,
            fontWeight: FontWeight.bold,
            color: AppColors.primary900),
        displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.primary800),
        displaySmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: AppColors.primary700),
        headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary900),
        headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary800),
        headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColors.primary700),
        titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary900),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary800),
        titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.primary700),
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColors.primary900),
        bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.primary800),
        bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.primary700),
        labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary500),
        labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.primary600),
        labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.primary700),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary500,
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: const CardTheme(
        elevation: 4,
        shadowColor: AppColors.primary950,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary700,
      scaffoldBackgroundColor: AppColors.primary900,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary800,
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
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 250,
            fontWeight: FontWeight.bold,
            color: AppColors.primary50),
        displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.primary200),
        displaySmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: AppColors.primary300),
        headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary50),
        headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary200),
        headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColors.primary300),
        titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary50),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary200),
        titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.primary300),
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColors.primary50),
        bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.primary200),
        bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.primary300),
        labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary500),
        labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.primary600),
        labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.primary700),
      ),
      cardTheme: const CardTheme(
        elevation: 4,
        shadowColor: AppColors.primary950,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary700,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
