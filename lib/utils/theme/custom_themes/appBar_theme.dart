import 'package:flutter/material.dart';

class MAppBarTheme{

  MAppBarTheme._();

  static const lightAppBarTheme = AppBarThemeData(
    elevation: 0,
    centerTitle: false,
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF400189),
    // surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'Vibur'),
  );

  static const darkAppBarTheme = AppBarThemeData(
    elevation: 0,
    centerTitle: false,
    foregroundColor: Colors.black,
    backgroundColor: Color(0xFF7207ED),
    // surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Vibur'),
  );
}