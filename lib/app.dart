import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mindslate/utils/theme/app_theme.dart';

class MindSlate extends StatelessWidget {
  const MindSlate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: DevicePreview.appBuilder,
        themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MindSlate'),
        ),
        body: Center(child: Text("This is the First MindSlate. Get Ready....")),
      ),
    );
  }
}