import 'package:flutter/material.dart';

class MAppBarTheme{

  MAppBarTheme._();

  static const lightAppBarTheme = AppBarThemeData(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.deepPurple,
    // surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
  static const darkAppBarTheme = AppBarThemeData(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.purple,
    // surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}