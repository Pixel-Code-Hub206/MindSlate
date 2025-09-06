import 'package:flutter/material.dart';
import 'package:mindslate/utils/theme/custom_themes/app_text_theme.dart';

class AppTheme{
  AppTheme._(); //Private Constructor

 static ThemeData lightTheme =  ThemeData(
   useMaterial3: true,
   fontFamily: 'Poppins',
   brightness: Brightness.light,
   primaryColor: Colors.blue,
   scaffoldBackgroundColor: Colors.white,
   textTheme: AppTextTheme.lightTextTheme,
 );
 static ThemeData darkTheme = ThemeData(
   useMaterial3: true,
   fontFamily: 'Poppins',
   brightness: Brightness.dark,
   primaryColor: Colors.blue,
   scaffoldBackgroundColor: Colors.black,
   textTheme: AppTextTheme.darkTextTheme,

 );
}