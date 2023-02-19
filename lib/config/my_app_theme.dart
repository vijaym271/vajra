import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vajra/utils/color_utils.dart';

class MyAppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: ColorUtils.red,
      scaffoldBackgroundColor: Color.fromARGB(255, 247, 247, 247),
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 38.0),
    displayMedium: TextStyle(fontSize: 36.0),
    displaySmall: TextStyle(fontSize: 34.0),
    headlineLarge: TextStyle(fontSize: 32.0),
    headlineMedium: TextStyle(fontSize: 30.0),
    headlineSmall: TextStyle(fontSize: 28.0),
    titleLarge: TextStyle(fontSize: 26.0),
    titleMedium: TextStyle(fontSize: 24.0),
    titleSmall: TextStyle(fontSize: 22.0),
    labelLarge: TextStyle(fontSize: 20.0),
    labelMedium: TextStyle(fontSize: 18.0),
    labelSmall: TextStyle(fontSize: 16.0),
    bodyLarge: TextStyle(fontSize: 14.0),
    bodyMedium: TextStyle(fontSize: 12.0),
    bodySmall: TextStyle(fontSize: 10.0),
  );
}
