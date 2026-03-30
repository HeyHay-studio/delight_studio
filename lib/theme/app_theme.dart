import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color backgroundBlack = Color(0xFF121212);
  static const Color surfaceCard = Color(0xFF1E1E1E);
  static const Color primarySilver = Color(0xFFC0C0C0);
  static const Color fontWhite = Colors.white;
  static const Color fontGrey = Colors.white70;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: backgroundBlack,
      scaffoldBackgroundColor: backgroundBlack,
      colorScheme: const ColorScheme.dark(
        primary: primarySilver,
        surface: surfaceCard,
        onSurface: fontWhite,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: fontWhite,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: fontWhite,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: fontWhite,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: fontWhite,
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 18,
          color: fontGrey,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14,
          color: fontGrey,
          height: 1.6,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
