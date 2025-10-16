import 'package:flutter/material.dart';
import 'package:mindslate/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:mindslate/utils/theme/custom_themes/floating_action_button_theme.dart';
import 'package:mindslate/utils/theme/custom_themes/icon_theme.dart';
import 'package:mindslate/utils/theme/custom_themes/text_theme.dart';
import 'package:mindslate/utils/theme/custom_themes/appBar_theme.dart';

class AppTheme{
  AppTheme._(); //Private Constructor

 static ThemeData lightTheme =  ThemeData(
   useMaterial3: true,
   fontFamily: 'Inter',
   brightness: Brightness.light,
   primaryColor: Colors.blue,
   cardColor: const Color(0xFFFFFFFF),
   scaffoldBackgroundColor: Colors.white,
   textTheme: AppTextTheme.lightTextTheme,
   appBarTheme: MAppBarTheme.lightAppBarTheme,
   floatingActionButtonTheme: MFloatingActionTheme.lightFloatingActionButtonTheme,
   checkboxTheme: MCheckBoxTheme.lightCheckBoxTheme,
 );
 static ThemeData darkTheme = ThemeData(
   useMaterial3: true,
   fontFamily: 'Inter',
   brightness: Brightness.dark,
   primaryColor: Colors.black,
   cardColor: const Color(0xFF3A3939),
   scaffoldBackgroundColor: Colors.black,
   textTheme: AppTextTheme.darkTextTheme,
   appBarTheme: MAppBarTheme.darkAppBarTheme,
   floatingActionButtonTheme: MFloatingActionTheme.darkFloatingActionButtonTheme,
   checkboxTheme: MCheckBoxTheme.darkCheckBoxTheme,
 );
}