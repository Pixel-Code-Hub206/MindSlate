import 'package:flutter/material.dart';
import 'package:mindslate/utils/theme/custom_themes/text_theme.dart';
import 'package:mindslate/utils/theme/custom_themes/appBar_theme.dart';

class AppTheme{
  AppTheme._(); //Private Constructor

 static ThemeData lightTheme =  ThemeData(
   useMaterial3: true,
   fontFamily: 'Poppins',
   brightness: Brightness.light,
   primaryColor: Colors.blue,
   scaffoldBackgroundColor: Colors.white,
   textTheme: AppTextTheme.lightTextTheme,
   appBarTheme: MAppBarTheme.lightAppBarTheme,
 );
 static ThemeData darkTheme = ThemeData(
   useMaterial3: true,
   fontFamily: 'Poppins',
   brightness: Brightness.dark,
   primaryColor: Colors.black,
   scaffoldBackgroundColor: Colors.black,
   textTheme: AppTextTheme.darkTextTheme,
   appBarTheme: MAppBarTheme.darkAppBarTheme,
 );
}