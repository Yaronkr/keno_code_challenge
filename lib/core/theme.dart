import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 32.0;
}

class DefaultColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBlue = Color(0xFF35CAF6);
  static const Color darkBlue = Color(0xFF3a3687);
  static const Color blue = Color(0xFF36A5F4);
  static const Color darkOrange = Color(0xFFe74110);
  static const Color lightOrange = Color(0xFFf0810b);
  static const Color appbarColor = Color(0xFF0860ad);

  static const Color green = Color(0xFF00843d);

  static const Color purple = Color(0xFF523191);

  static const List<Color> ballsColors = [lightBlue, darkOrange, appbarColor, green, purple, darkBlue];

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.0, 1.0],
    colors: [
      darkOrange,
      lightOrange,
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.0, 1.0],
    colors: [
      blue,
      darkBlue,
    ],
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        foregroundColor: DefaultColors.white,
        color: DefaultColors.appbarColor,
        titleTextStyle: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.white,
        ),
        toolbarTextStyle: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.white,
        ),
      ),
      primaryColor: DefaultColors.white,
      focusColor: Color(0xFF371B34),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.standard,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: Colors.white,
        ),
      ),
    );
  }
}
