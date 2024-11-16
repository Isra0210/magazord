import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF178F4E);
const secondary = Color(0xFF4159E1);
const tertiary = Color(0xFFE52A44);
const white = Color(0xFFFFFFFF);
const backgroundDark = Color(0xFF121212);
const black = Color(0xFF000000);

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: primaryColor.withOpacity(0.3),
      secondary: secondary,
      onSecondary: secondary.withOpacity(0.3),
      tertiary: tertiary,
      onTertiary: tertiary.withOpacity(0.3),
      surface: const Color(0xFFF5F5F5),
      onSurface: black,
      error: const Color(0xFFB00020),
    ),
    textTheme: textTheme(black),
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: white,
      titleTextStyle: GoogleFonts.montserrat(fontSize: 20, color: black),
      iconTheme: const IconThemeData(color: black),
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: black),
      checkColor: WidgetStateProperty.all(white),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      onPrimary: primaryColor.withOpacity(0.2),
      secondary: secondary,
      onSecondary: secondary.withOpacity(0.2),
      tertiary: tertiary,
      onTertiary: tertiary.withOpacity(0.2),
      // surface: const Color(0xFF1E1E1E),
      surface: const Color(0xFF1E1E1E),
      onSurface: white,
      error: const Color(0xFFCF6679),
    ),
    scaffoldBackgroundColor: backgroundDark,
    textTheme: textTheme(white),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: backgroundDark,
      titleTextStyle: GoogleFonts.montserrat(fontSize: 20, color: white),
      iconTheme: const IconThemeData(color: white),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.transparent),
      checkColor: WidgetStateProperty.all(black),
      overlayColor: WidgetStateProperty.all(white),
      side: const BorderSide(color: white, width: 1),
    ),
  );

  static TextTheme textTheme(Color textColor) {
    return TextTheme(
      labelSmall: GoogleFonts.montserrat(fontSize: 8, color: textColor),
      labelMedium: GoogleFonts.montserrat(fontSize: 10, color: textColor),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      bodySmall: GoogleFonts.montserrat(fontSize: 12, color: textColor),
      bodyMedium: GoogleFonts.montserrat(fontSize: 14, color: textColor),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleSmall: GoogleFonts.montserrat(fontSize: 16, color: textColor),
      titleMedium: GoogleFonts.montserrat(fontSize: 18, color: textColor),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displayMedium: GoogleFonts.montserrat(fontSize: 20, color: textColor),
    );
  }
}

ThemeData getCurrentTheme(bool isDarkTheme) {
  if (isDarkTheme) return AppTheme.darkTheme;
  return AppTheme.lightTheme;
}

topBoxShadow(ThemeMode themeMode) => BoxShadow(
      blurRadius: 0.1,
      spreadRadius: 0.1,
      offset: const Offset(-1, -1),
      color: themeMode == ThemeMode.light ? Colors.black12 : Colors.white12,
    );

bottomBoxShadow(ThemeMode themeMode) => BoxShadow(
      blurRadius: 0.1,
      spreadRadius: 0.1,
      offset: const Offset(1, 1),
      color: themeMode == ThemeMode.light ? Colors.black26 : Colors.white12,
    );
