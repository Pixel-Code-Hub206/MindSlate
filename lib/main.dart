import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mindslate/utils/theme/app_theme.dart';
import 'package:mindslate/pages/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() => runApp(
    DevicePreview(
      enabled: kDebugMode,
       builder: (context) => MaterialApp(
           builder: DevicePreview.appBuilder,   //To enable Device Preview
         useInheritedMediaQuery: true,      //Required
           home: Home(),
           themeMode: ThemeMode.system,      //ThemeData
           theme: AppTheme.lightTheme,
           darkTheme: AppTheme.darkTheme,
       ),
    ),
);
