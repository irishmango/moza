import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color appOrange = Color.fromRGBO(249, 172, 79, 1.0);
  static Color appOrangeAccent = Color.fromRGBO(255, 141, 0, 1.0);
  static Color appRed = Color.fromRGBO(248, 118, 93, 1.0);
  static Color appRedAccent = Color.fromRGBO(238, 81, 50, 1);
  static Color appBlue = Color.fromRGBO(60, 121, 208, 1.0);
  static Color appBlueAccent = Color.fromRGBO(0, 86, 209, 1.0);
  static Color appLightBlue = Color.fromRGBO(229, 237, 255, 1.0);
  static Color appLightBlueAccent = Color.fromRGBO(190, 210, 255, 1.0);
  static Color appGreen = Color.fromRGBO(92, 181, 115, 1.0);
  static Color appGreenAccent = Color.fromRGBO(49, 124, 67, 1.0);
  static Color appWhite = Color.fromRGBO(250, 250, 250, 1.0);
  static Color textColor = Color.fromRGBO(31, 30, 30, 1.0);
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appOrange),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.appLightBlue.withAlpha(76),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.appOrange, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.appOrange, width: 2.0),
    ),
    labelStyle: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w500,
    ),
    prefixIconColor: AppColors.textColor,
  ),
);