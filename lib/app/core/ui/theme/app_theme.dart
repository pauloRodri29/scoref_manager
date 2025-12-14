import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.brandMain,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.brandMain,
        foregroundColor: AppColors.textOnPrimaryLight,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.brandMain,
        onPrimary: AppColors.textOnPrimaryLight,
        secondary: AppColors.brandDark,
        onSecondary: AppColors.textOnPrimaryLight,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.textPrimaryLight,
        error: AppColors.error,
        onError: AppColors.textOnPrimaryLight,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 250,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondaryLight,
        ),
        displaySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondaryLight,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondaryLight,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.brandMain,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.brandDark,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.brandDark,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.textOnPrimaryLight),
          backgroundColor: WidgetStatePropertyAll(AppColors.brandMain),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              const WidgetStatePropertyAll(AppColors.textOnPrimaryLight),
          backgroundColor: const WidgetStatePropertyAll(AppColors.brandMain),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(AppColors.brandMain),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.brandMain, width: 1.5),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // buttonTheme: const ButtonThemeData(
      //   buttonColor: AppColors.brandMain,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      cardTheme: const CardThemeData(
        elevation: 4,
        shadowColor: AppColors.shadow,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        hintStyle: TextStyle(color: Colors.black.withValues(alpha: .6)),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textPrimaryLight,
        size: 24,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.brandDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textOnPrimaryDark,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.brandDark,
        onPrimary: AppColors.textOnPrimaryDark,
        secondary: AppColors.brandMain,
        onSecondary: AppColors.textOnPrimaryDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textPrimaryDark,
        error: AppColors.error,
        onError: AppColors.textOnPrimaryDark,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 250,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondaryDark,
        ),
        displaySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondaryDark,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondaryDark,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.brandMain,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.brandDark,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.brandDark,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 4,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.textOnPrimaryLight),
          backgroundColor: WidgetStatePropertyAll(AppColors.brandMain),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              const WidgetStatePropertyAll(AppColors.textOnPrimaryLight),
          backgroundColor: const WidgetStatePropertyAll(AppColors.brandMain),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(AppColors.brandMain),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.brandMain, width: 1.5),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // buttonTheme: const ButtonThemeData(
      //   buttonColor: AppColors.brandDark,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: .6)),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textPrimaryDark,
        size: 24,
      ),
    );
  }
}
