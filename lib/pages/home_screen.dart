import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mindslate/models/tasks.dart';
import 'package:mindslate/models/boxes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formGlobalKey = GlobalKey<FormState>();
  String _taskTitle = '';
  String _taskBody = '';
  Priority _selectedPriority = Priority.low;

  final tasksBox = Boxes.getTasks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Mind',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Vibur',
                    fontSize: 26.0,
                  ),
                ),

                SizedBox(width: 1.0),

                Card(
                  color: Theme.of(context).colorScheme.surface,
                 child: Container(
                   margin: const EdgeInsets.all(2.0),
                   padding: const EdgeInsets.all(2.0),
                     child: Text(
                         'Slate',
                       style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                         color: Theme.of(context).colorScheme.onSurface,
                         fontWeight: FontWeight.w600,
                         fontFamily: 'Vibur',
                         fontSize: 26.0,
                       ),
                     ),
                 ),
                ),
              ],
            ),
          ),
        ),

        body: ListView.builder(
          itemCount: tasksBox.length,
            itemBuilder: (BuildContext context, int index){
            final task = tasksBox.getAt(index);
            if(task == null) return SizedBox();   //PlaceHolder if DB is empty

            return Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
              child: Card(
                color: Theme.of(context).cardColor,

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 3.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                task.isTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                              //CheckBox
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 0.0, 4.0),
                                child: Checkbox(value: task.isDone,
                                  onChanged: (newBool) {
                                    task.toggleDone();
                                    setState(() {});
                                  },
                                ),
                              ),

                              SizedBox(width: 5.0),

                              //Body of the Task
                                Expanded(
                                  flex: 9,
                                  child: Text(
                                    task.isBody,     //Task Description
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      decoration: task.isDone  //If the task is finished
                                          ? TextDecoration.lineThrough    //Strike it!
                                          : TextDecoration.none,
                                      decorationThickness: task.isDone ? 1.5 : null,
                                    ),
                                  ),
                                ),

                          Spacer(),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4.0, 10.0, 4.0),
                            child: IconButton(onPressed: (){
                              print('Task is deleted');   //Console logs
                              deleteTask(index);
                            },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                            child: Text(
                              priorityFromString(task.priority).pTitle,
                              style: TextStyle(
                                color: priorityFromString(task.priority).color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ); //Test data over the UI,
            },
        ),

        floatingActionButton: Builder(
            builder: (innerContext) => FloatingActionButton(
              onPressed: () {
                print('FAB clicked!');
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
                              maxLength: 25,
                              decoration: const InputDecoration(
                                hintText: 'Enter your title',
                                labelText: 'Task Title',
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty || value.length < 2)
                                {
                                  return "Title too short";
                                }
                                return null;  //If no-errors
                              },
                              onSaved: (value) {
                                _taskTitle= value!;   //Updating the task's description after validation
                              },
                            ),

                            TextFormField(    //Input for the task description
                              maxLength: 40,
                              decoration: const InputDecoration(
                                hintText: 'Enter your description',
                                labelText: 'Task Description',
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty || value.length < 5)
                                  {
                                    return "Add more details";
                                  }
                                  return null;  //If no-errors
                              },
                                onSaved: (value) {
                                  _taskBody = value!;   //Updating the task's description after validation
                                },
                            ),

                            DropdownButtonFormField(
                              value: _selectedPriority,
                              decoration: const InputDecoration(
                                hintText: 'Set your Priority',
                                labelText: 'Task Priority',
                              ),
                              items: Priority.values.map((p) {
                                return DropdownMenuItem(
                                  value: p,
                                    child: Text(p.pTitle),  //Using the p identifier to mark each item in the list
                                );
                            }).toList(),
                                onChanged: (value) {
                                setState(() {
                                  _selectedPriority = value!; //Save the selected priority and rebuild the widget
                                });
                                },
                            ),

                            Spacer(),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 30.0),
                                child: FilledButton(onPressed: () {
                                  if(_formGlobalKey.currentState!.validate()){ //Form Validation
                                    _formGlobalKey.currentState!.save();  //Lock the data from the fields
                                    addTask();    //Only adds to-do's once the Form is validated
                                    _formGlobalKey.currentState!.reset();
                                    Navigator.pop(context);   //Close the Sheet once the form is submitted
                                  }
                                },
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                                  ),
                                    child: Text(
                                      'Add Task',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).appBarTheme.foregroundColor,
                                      ),
                                    ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
              ),
            ),
        ),
      );
  }

  void addTask(){
    setState(() {   //Using SetState to display changes in the actual UI by updating the list within
      tasksBox.add(Tasks(
          isTitle: _taskTitle,    //Saving the local input data and storing it with a new instance for the list
          isBody: _taskBody,
          priority: _selectedPriority.nameValue,
          isDone: false
      ));
    });
  }

  void deleteTask(int index){     //Deletes the tasks and removes them from the UI
    setState(() {
      tasksBox.deleteAt(index);
    });
  }

  void toggleDone(int index)    //Striking the task once completed
  {
    final task = tasksBox.getAt(index);
    setState(() {
      task?.toggleDone();
      task?.save();
    });
  }
}
