import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

class MindSlate extends StatelessWidget {
  const MindSlate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(),
        body: Text("This is the First MindSlate. Get Ready...."),
      ),
    );
  }
}
