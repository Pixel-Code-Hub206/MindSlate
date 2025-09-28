import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mindslate/pages/home_screen.dart';

void main() => runApp(
    DevicePreview(
      enabled: kDebugMode,
       builder: (context) => Home()
    ),
);
