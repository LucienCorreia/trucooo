import 'package:flutter/material.dart';

abstract class AppTheme {
  static final theme = ThemeData();

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.red,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.red,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}
