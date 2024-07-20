import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme:const IconThemeData(size: 30, color: Color(0xFF242424)),
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.colorBlack,
      ),
      shadowColor: Colors.transparent,
    ),
    dividerTheme:const DividerThemeData(color: AppColors.primary, thickness: 3),
    iconTheme:const IconThemeData(color: AppColors.primary, size: 25),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.colorBlack,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primary,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.colorBlack,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: AppColors.colorBlack,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.colorBlack,
      ),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.primary,
        secondary: AppColors.primary,
        onSecondary: AppColors.primary,
        error: AppColors.primary,
        onError: AppColors.primary,
        background: AppColors.primary,
        onBackground: AppColors.primary,
        surface: AppColors.primary,
        onSurface: AppColors.primary),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme:const IconThemeData(size: 30, color: Colors.white),
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      shadowColor: Colors.transparent,
    ),
    dividerTheme:const DividerThemeData(color: AppColors.primary, thickness: 3),
    iconTheme:const IconThemeData(color: AppColors.yellowColor, size: 25),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryDark,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.yellowColor,
      ),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.primary,
        secondary: AppColors.primary,
        onSecondary: AppColors.primary,
        error: AppColors.primary,
        onError: AppColors.primary,
        background: AppColors.primary,
        onBackground: AppColors.primary,
        surface: AppColors.primary,
        onSurface: AppColors.primary),
  );
}