import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mindslate/models/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formGlobalKey = GlobalKey<FormState>();
  String _taskBody = '';

  final List<Tasks> _tasks = [
    Tasks(isBody: 'Task 1', isDone: false),
    Tasks(isBody: 'Task 2', isDone: true),
    Tasks(isBody: 'Task X', isDone: false),
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
                      key: _formGlobalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20.0),

                            TextFormField(    //Input for the task description
                              maxLength: 40,
                              decoration: const InputDecoration(
                                label: Text('Task Description'),
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty || value.length < 5)
                                  {
                                    return "The given task must be lengthier";
                                  }
                                  return null;  //If no-errors
                              },
                                onSaved: (value) {
                                  _taskBody = value!;   //Updating the task's description after validation
                                },
                            ),

                            SizedBox(height: 10.0),

                            FilledButton(onPressed: () {
                              if(_formGlobalKey.currentState!.validate()){ //Form Validation
                                _formGlobalKey.currentState!.save();  //Lock the data from the fields
                                addTask();    //Only adds to-do's once the Form is validated
                              }
                            },
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.purple[700],
                              ),
                                child: const Text(
                                  'Add Task',
                                ),
                            ),
                          ],
                        ),
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
      _tasks.add(Tasks(
          isBody: _taskBody,
          isDone: false
      ));
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
