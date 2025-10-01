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

  final List<Tasks> _tasks = [
    Tasks(isTitle: 'The header', isBody: 'The Content', isDone: false),
    Tasks(isTitle: '2nd header', isBody: 'More Content', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,  //Device Preview
      themeMode: ThemeMode.system,      //ThemeData
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MindSlate'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _tasks.length,
            itemBuilder: (BuildContext context, int index){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Card(
                child: Text('${_tasks[index].isBody}'), //Test data over the UI
              ),
            );
            },
        ),
      ),
    );
  }

  void addTask(){
    setState(() {   //Using SetState to display changes in the actual UI and not just the list within
      _tasks.add(Tasks(isTitle: 'Heading 1', isBody: 'Body', isDone: false));  //Placeholder function call with dummy details
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
