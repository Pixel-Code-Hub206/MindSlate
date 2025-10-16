import 'package:flutter/material.dart';

class MFloatingActionTheme{

  MFloatingActionTheme._();

  static const lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: Color(0xFF000000),
  );

  static const darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF3A3939),
    foregroundColor: Color(0xFFFFFFFF),
  );
}