import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class AppTheme {
  static ThemeData light() {
    final colorScheme = const ColorScheme.light(
      primary: AppColors.brandMain,
      onPrimary: AppColors.textOnPrimaryLight,
      secondary: AppColors.brandDark,
      onSecondary: AppColors.textOnPrimaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textPrimaryLight,
      error: AppColors.error,
      onError: AppColors.textOnPrimaryLight,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,

      // Base
      scaffoldBackgroundColor: AppColors.backgroundLight,

      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
      ),

      // Text
      textTheme: _textThemeLight(),

      // Cards / surfaces
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: 2,
        shadowColor: AppColors.shadow.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        hintStyle: TextStyle(
          color: AppColors.textSecondaryLight.withValues(alpha: 0.8),
        ),
        labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.textSecondaryLight.withValues(alpha: 0.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.brandMain, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),

      // Icons
      iconTheme: const IconThemeData(
        color: AppColors.textPrimaryLight,
        size: 24,
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandMain,
          foregroundColor: AppColors.textOnPrimaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.brandMain,
          foregroundColor: AppColors.textOnPrimaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.brandMain,
          side: const BorderSide(color: AppColors.brandMain, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.brandDark,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      // IconButton: aqui entra o que você tentou fazer antes 🙂
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textPrimaryLight,
        ),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: AppColors.textSecondaryLight.withValues(alpha: 0.15),
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData dark() {
    final colorScheme = const ColorScheme.dark(
      primary: AppColors.brandMain,
      onPrimary: AppColors.textOnPrimaryDark,
      secondary: AppColors.brandLight,
      onSecondary: AppColors.textOnPrimaryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      error: AppColors.error,
      onError: AppColors.textOnPrimaryDark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: _textThemeDark(),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        hintStyle: TextStyle(
          color: AppColors.textSecondaryDark.withValues(alpha: 0.85),
        ),
        labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.textSecondaryDark.withValues(alpha: 0.18),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.brandMain, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textPrimaryDark,
        size: 24,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandMain,
          foregroundColor: AppColors.textOnPrimaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.brandMain,
          foregroundColor: AppColors.textOnPrimaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.brandLight,
          side: const BorderSide(color: AppColors.brandLight, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.brandLight,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textPrimaryDark,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.textSecondaryDark.withValues(alpha: 0.18),
        thickness: 1,
        space: 1,
      ),
    );
  }

  static TextTheme _textThemeLight() {
    return const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryLight),
      headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryLight),
      titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryLight),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondaryLight),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondaryLight),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryLight),
    ).apply(fontFamily: 'Montserrat');
  }

  static TextTheme _textThemeDark() {
    return const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark),
      headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark),
      titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondaryDark),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondaryDark),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark),
    ).apply(fontFamily: 'Montserrat');
  }
}
