import 'package:flutter/material.dart';

class MAppBarTheme{

  MAppBarTheme._();

  static const lightAppBarTheme = AppBarThemeData(
    elevation: 0,
    centerTitle: false,
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF5C0375),
    // surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static const darkAppBarTheme = AppBarThemeData(
    elevation: 0,
    centerTitle: false,
    foregroundColor: Colors.black,
    backgroundColor: Color(0xFF9402BE),
    // surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}