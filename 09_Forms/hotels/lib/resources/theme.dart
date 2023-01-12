import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData hotelsTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: CardTheme(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    );
  }
}

class AppConstants {
  static const double textPadding = 10.0;
  static const double cardRadius = 10.0;
}
