import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  primaryColorDark: AppColors.orange,
  appBarTheme: _appBarLight(),
  bottomNavigationBarTheme: _bottomNavigationBarLight(),
  cardTheme: _cardLight(),
  chipTheme: _chipLight(),
  dialogTheme: _dialogLight(),
  elevatedButtonTheme: _elevatedButtonLight(),
  inputDecorationTheme: _inputDecorationLight(),
  progressIndicatorTheme: _progressIndicatorLight(),
  textSelectionTheme: _textSelectionLight(),
  textTheme: _textLight(_themeLight.textTheme),
);

AppBarTheme _appBarLight() {
  return AppBarTheme(
    color: AppColors.grey,
    titleTextStyle: TextStyle(
      color: AppColors.orange,
      fontSize: 20.0,
      fontFamily: 'Raleway',
    ),
    actionsIconTheme: IconThemeData(color: AppColors.orange),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarLight() {
  return BottomNavigationBarThemeData(
    backgroundColor: AppColors.grey,
    selectedItemColor: AppColors.orange,
    unselectedItemColor: AppColors.black,
  );
}

CardTheme _cardLight() {
  return CardTheme(
    color: AppColors.orange,
    clipBehavior: Clip.hardEdge,
    elevation: 6.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    margin: EdgeInsets.all(10.0),
  );
}

ChipThemeData _chipLight() {
  return ChipThemeData(
    backgroundColor: AppColors.grey,
    selectedColor: AppColors.orange,
    showCheckmark: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    elevation: 4.0,
    labelStyle: TextStyle(color: AppColors.white),
  );
}

DialogTheme _dialogLight() {
  return DialogTheme(
    backgroundColor: AppColors.lightGrey,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonLight() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(AppColors.orange!),
      foregroundColor: MaterialStatePropertyAll<Color>(AppColors.black),
      textStyle: MaterialStatePropertyAll<TextStyle>(
        TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
  );
}

InputDecorationTheme _inputDecorationLight() {
  return InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: AppColors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: AppColors.orange!),
    ),
    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
      (Set<MaterialState> states) {
        final Color color = states.contains(MaterialState.focused)
            ? AppColors.orange!
            : AppColors.grey;
        return TextStyle(color: color, fontWeight: FontWeight.bold);
      },
    ),
    suffixIconColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.focused)
            ? AppColors.orange!
            : AppColors.grey),
  );
}

ProgressIndicatorThemeData _progressIndicatorLight() {
  return ProgressIndicatorThemeData(color: AppColors.grey);
}

TextSelectionThemeData _textSelectionLight() {
  return TextSelectionThemeData(cursorColor: AppColors.orange);
}

TextTheme _textLight(TextTheme base) {
  return base
      .copyWith(
        headlineLarge: TextStyle(color: AppColors.grey, fontSize: 30.0),
      )
      .apply(fontFamily: 'Raleway');
}

class AppColors {
  static final orange = Colors.deepOrange[100];
  static final lightGrey = Colors.grey[400];
  static final grey = Colors.black54;
  static final black = Colors.black;
  static final white = Colors.white;
}
