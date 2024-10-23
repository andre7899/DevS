import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  //Cupertino Theme ----------------------------------
  static const _textTheme = CupertinoTextThemeData(
      textStyle: TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
  ));

  static const cupertinoTheme = CupertinoThemeData(
    textTheme: _textTheme,
    primaryColor: Color(0xFF005AC1),
    primaryContrastingColor: CupertinoColors.white,
    brightness: Brightness.light,
  );

  // Material theme -----------------------------------
  static final _cardTheme = CardTheme(
    color: Colors.white,
    surfaceTintColor: Colors.grey,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final _filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle: const TextStyle(fontSize: 25),
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );

  static final _dialogTheme = DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

  static final _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  );

  static final materialTheme = ThemeData(
    colorSchemeSeed: AppColors.primary,
    cardTheme: _cardTheme,
    filledButtonTheme: _filledButtonTheme,
    dialogBackgroundColor: AppColors.primary,
    dialogTheme: _dialogTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
