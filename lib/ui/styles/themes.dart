import 'package:flutter/material.dart';

final appTheme = ThemeData(
  splashColor: Colors.white,
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  accentColor: Colors.redAccent,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.00)),
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 12.50,
      horizontal: 10.00,
    ),
  ),
);
