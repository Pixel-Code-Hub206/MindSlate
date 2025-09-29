import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mindslate/utils/theme/app_theme.dart';
import 'package:mindslate/models/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List _tasks = <Tasks> [

  ];

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
        body: Center(child: Text("Home Screen")),
      ),
    );
  }

  void addTask(){
    setState(() {   //Using SetState to display changes in the actual UI and not just the list within
      _tasks.add("title: Placeholder, isDone: false");  //Placeholder details
    });
  }

  void deleteTask(int index){
    setState(() {
      _tasks.remove(index);
    });
  }

  void toggleDone(int index)    //Striking the task once completed
  {
    setState(() {
      _tasks[index].toggleDone();
    });
  }
}
