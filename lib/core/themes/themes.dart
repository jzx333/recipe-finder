import 'package:flutter/material.dart';

class AppColors {
  static const lightGreen = Color(0xFF99d98c);
  static const white = Color(0xFFffffff);
  static const dirtyGreen = Color(0xFF3f4a3c);
  static const darkGreen = Color(0xFF003200);
  static const lightGrayLightGreen = Color(0xFFf4fcf1);
  static const lightGray = Color(0xFFd9d9d9);
}


ThemeData createLightTheme() {
  return ThemeData(
    primaryColor: AppColors.lightGreen,
    scaffoldBackgroundColor: AppColors.lightGreen,

    colorScheme: ThemeData().colorScheme.copyWith(
      primaryContainer: AppColors.white,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightGrayLightGreen
    ),
  );
}
