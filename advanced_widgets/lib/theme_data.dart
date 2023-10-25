import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData candyTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 22, color: Color(0xFF212529)),
      headlineMedium: TextStyle(fontSize: 18, color: Color(0xFF343a40)),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF6c757d)),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFcdb4db),
      iconTheme: IconThemeData(color: Color(0xFF343a40)),
    ),
    scaffoldBackgroundColor: const Color(0xFFffc8dd),
    drawerTheme: DrawerThemeData(
      backgroundColor: const Color(0xFFbde0fe),
      scrimColor: const Color(0xFFbde0fe).withOpacity(0.2),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFffafcc),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFffafcc),
    ),
  );

  ThemeData plantTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 22, color: Color(0xFFBC6C25)),
      headlineMedium: TextStyle(fontSize: 18, color: Color(0xFFDDA15E)),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFBC6C25)),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF283618),
      iconTheme: IconThemeData(color: Color(0xFFBC6C25)),
    ),
    scaffoldBackgroundColor: const Color(0xFFFEFAE0),
    drawerTheme: DrawerThemeData(
      backgroundColor: const Color(0xFF606C38),
      scrimColor: const Color(0xFF606C38).withOpacity(0.2),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF283618),
      foregroundColor: Color(0xFFFEFAE0),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF283618),
    ),
  );

  ThemeData waterTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 22, color: Color(0xFF1B4965)),
      headlineMedium: TextStyle(fontSize: 18, color: Color(0xFF1B4965)),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF1B4965)),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF62B6CB),
      iconTheme: IconThemeData(color: Color(0xFF1B4965)),
    ),
    scaffoldBackgroundColor: const Color(0xFFBEE9E8),
    drawerTheme: DrawerThemeData(
      backgroundColor: const Color(0xFF5FA8D3),
      scrimColor: const Color(0xFFCAE9FF).withOpacity(0.2),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF62B6CB),
      foregroundColor: Color(0xFFBEE9E8),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF62B6CB),
    ),
  );

  ThemeData sunsetTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 22, color: Color(0xFF212529)),
      headlineMedium: TextStyle(fontSize: 18, color: Color(0xFF343a40)),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF6c757d)),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFE2711D),
      iconTheme: IconThemeData(color: Color(0xFFCC5803)),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFC971),
    drawerTheme: DrawerThemeData(
      backgroundColor: const Color(0xFFFFB627),
      scrimColor: const Color(0xFFFFB627).withOpacity(0.2),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE2711D),
      foregroundColor: Color(0xFFFFC971),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFE2711D),
    ),
  );

  ThemeData vintageTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 22, color: Color(0xFF212529)),
      headlineMedium: TextStyle(fontSize: 18, color: Color(0xFF343a40)),
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF6c757d)),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFD6CCC2),
      iconTheme: IconThemeData(color: Color(0xFF6c757d)),
    ),
    scaffoldBackgroundColor: const Color(0xFFF5EBE0),
    drawerTheme: DrawerThemeData(
      backgroundColor: const Color(0xFFD5BDAF),
      scrimColor: const Color(0xFFD5BDAF).withOpacity(0.2),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE3D5CA),
      foregroundColor: Color(0xFF6c757d),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFE3D5CA),
    ),
  );
}
