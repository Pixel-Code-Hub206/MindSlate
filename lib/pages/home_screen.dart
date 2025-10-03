import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
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
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('MindSlate'),
          centerTitle: true,
          backgroundColor: Colors.purple[700],
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
                      print('Task is deleted');   //Console logs
                      deleteTask(index);
                    },
                        icon: Icon(Icons.delete),
                        color: Colors.grey[500],
                    ),
                  ),
                ),
            ); //Test data over the UI,
            },
        ),
        floatingActionButton: Builder(
            builder: (innerContext) => FloatingActionButton(
              onPressed: () {
                print('Task added to the list');
                showModalBottomSheet(context: context,
                  builder: (BuildContext context)
                  {
                    return Form(
                      child: Column(
                        children: [
                          TextFormField(    //Input for the task description
                            maxLength: 40,
                            decoration: const InputDecoration(
                              label: Text('Enter the task Description'),
                            ),
                          ),
                          Text('This is a Bottom Sheet preview'),
                        ],
                      ),
                    );
                  },
                );
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

  void deleteTask(int index){     //Deletes the tasks and removes them from the UI
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void toggleDone(int index)    //Striking the task once completed
  {
    setState(() {
      _tasks[index].toggleDone();
    });
  }
}
