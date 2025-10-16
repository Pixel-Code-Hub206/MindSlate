import 'package:flutter/material.dart';

class MIconTheme{
  MIconTheme._();

  static ThemeData lightIconTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );

  static ThemeData darkIconTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}