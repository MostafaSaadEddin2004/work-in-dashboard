import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

abstract class AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        labelLarge: TextStyle(
            fontSize: 26, color: AppColor.white, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            fontSize: 24, color: AppColor.white, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            fontSize: 22, color: AppColor.white, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          fontSize: 22,
          color: AppColor.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          color: AppColor.white,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColor.white,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        onPrimary: AppColor.black,
        onSecondary: AppColor.white,
        surface: AppColor.blue,
        onSurface: AppColor.grey,
      ),
      cardTheme: const CardTheme(color: AppColor.secondary),);
}
