import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF99d98c);
  static const secondaryColor = Color(0xFFffffff);
  static const secondaryTextColor = Color(0xFF3f4a3c);
  static const primaryTextColor = Color(0xFF003200);
  static const textOnPrimaryColor = Color(0xFFf4fcf1);
  static const unselectedColor = Color(0xFFd9d9d9);
}

class AppTextStyles {
  static const recipeTitleOnDss = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  );
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
  );
}

ThemeData createLightTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.textOnPrimaryColor,
      //splashColor: AppColors.textOnPrimaryColor,
      //hoverColor: AppColors.primaryColor
    ),
  );
}
