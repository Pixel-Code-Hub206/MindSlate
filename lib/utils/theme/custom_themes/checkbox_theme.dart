import 'package:flutter/material.dart';

class MCheckBoxTheme{

  MCheckBoxTheme._();

  static final lightCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.black;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(Colors.white),
  );

  static final darkCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(Colors.black),
  );
}