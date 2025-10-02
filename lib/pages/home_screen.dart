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
    Tasks(isBody: 'The Content', isDone: false),
    Tasks(isBody: 'More Content', isDone: true),
    Tasks(isBody: 'Even More Content', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,  //Device Preview
      themeMode: ThemeMode.system,      //ThemeData
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('MindSlate'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _tasks.length,
            itemBuilder: (BuildContext context, int index){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
              child: Card(
                  child: ListTile(
                    leading : Checkbox(value: _tasks[index].isDone,
                        onChanged: (newBool) {
                      toggleDone(index);
                        },
                    ),

                      title: Text(
                        '${_tasks[index].isBody}',
                        style: TextStyle(
                          fontSize: 18.0,
                          decoration: _tasks[index].isDone  //If the task is finished
                              ? TextDecoration.lineThrough    //Strike it!
                              : TextDecoration.none,
                          decorationThickness: _tasks[index].isDone ? 2 : null,
                        ),
                      ),
                    trailing: IconButton(onPressed: (){
                      print('Task is deleted');
                    },
                        icon: Icon(Icons.delete),
                        color: Colors.grey[500],
                    ),
                  ),
                ),
            ); //Test data over the UI,
            },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('Task added to the list');
            },
            child: const Icon(
            Icons.add,
              color: Colors.blueGrey,
        ),
        ),
      ),
    );
  }

  void addTask(){
    setState(() {   //Using SetState to display changes in the actual UI and not just the list within
      _tasks.add(Tasks(isBody: 'Body', isDone: false));  //Placeholder function call with dummy details
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
