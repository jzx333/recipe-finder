import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/themes/colors.dart';

ThemeData createLightTheme() {
  return ThemeData(
    primaryColor: AppColors.lightGreen,
    scaffoldBackgroundColor: AppColors.lightGreen,
    textTheme: _baseTextTheme(isDark: false),
    colorScheme: ThemeData().colorScheme.copyWith(
          primaryContainer: AppColors.white,
          outline: AppColors.lightGray,
        ),
    fontFamily: "Inter",
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightGrayLightGreen,
      foregroundColor: Colors.black.withValues(alpha: 0.5),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        overlayColor: WidgetStatePropertyAll(
          Colors.grey.shade900.withAlpha(20),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightGreen,
    )
  );
}

TextTheme _baseTextTheme({required bool isDark}) {
  if (!isDark) {
    /// Light theme
    return const TextTheme(
      // title
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),


      // display
      displaySmall: TextStyle(
        fontSize: 12,
        color: AppColors.dirtyGreen,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        color: AppColors.dirtyGreen,
      ),
      displayLarge: TextStyle(
        fontSize: 24,
        color: AppColors.dirtyGreen,
      ),

      // body
      bodySmall: TextStyle(
        fontSize: 10,
        color: AppColors.darkGreen,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.darkGreen,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColors.darkGreen,
        fontWeight: FontWeight.bold,
      ),

      // label
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.darkGray,
      ),

      // headline
      headlineLarge: TextStyle(
        color: AppColors.lightGrayLightGreen,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  } else {
    return const TextTheme();
  }
}

extension ThemeDataX on ThemeData {
  double get horizontalPadding => 24;
}
