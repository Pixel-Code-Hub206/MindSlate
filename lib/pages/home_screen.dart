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

  final tasksBox = Boxes.getTasks();

  @override
  void initState() {
    super.initState();

    final settingBox = Boxes.getSettings();     //Box to implement welcome tasks for the home screen
    bool isFirstTime = settingBox.get('isFirstTime', defaultValue: true);   //Flag to check if the app was opened for the first time

    if(isFirstTime){
      createInitialData();
    }
  }
  void createInitialData(){
    final settingBox = Boxes.getSettings();

    // Task 1: The Welcome Task
    tasksBox.add(
      Tasks(
        isTitle: 'Hello there!',
        isBody: 'Welcome to MindSlate!',
        isDone: false,
        priority: 'medium',
      ),
    );

    // Task 2: The Core Action (Adding)
    tasksBox.add(
      Tasks(
        isTitle: 'Create a new task',
        isBody: 'Tap the "+" button to add your own items.',
        isDone: false,
        priority: 'high',
      ),
    );

    // Task 3: The Other Actions (Completing & Deleting)
    tasksBox.add(
      Tasks(
        isTitle: 'Manage your list',
        isBody: 'Tap the checkbox to complete a task, or the bin to remove it.',
        isDone: false,
        priority: 'low',
      ),
    );

    // Set the flag to false so this block never runs again.
    settingBox.put('isFirstTime', false);
    setState(() {});    //Refreshing the UI
  }

  final _formGlobalKey = GlobalKey<FormState>();
  String _taskTitle = '';
  String _taskBody = '';
  Priority _selectedPriority = Priority.low;

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

                SizedBox(width: 2.0),

                Card(
                  color: Theme.of(context).colorScheme.surface,
                 child: Container(
                   margin: const EdgeInsets.all(2.0),
                   padding: const EdgeInsets.fromLTRB(4.0, 2.0, 6.0, 0.0),
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
          toolbarHeight: 70.0,
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context)
                  {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter modalSetState) {

                        // 1. Create controller *INSIDE* the Builder
                        final TextEditingController priorityController = TextEditingController(
                          text: _selectedPriority.pTitle,
                        );

                        return SingleChildScrollView(   //Prevents Overflow errors
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 350),    //Makes the form manifest smoother over the screen
                            curve: Curves.easeOut,
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,   //Pushes the form up by the exact height required
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,       //Prevents the form from taking the entire screen
                              children: [
                                Form(
                                  key: _formGlobalKey,      //The form controller key
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20.0),

                                        TextFormField(
                                          maxLength: 25,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter your title',
                                            labelText: 'Task Title',
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty || value.length < 2) {
                                              return "Title too short";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _taskTitle = value!;
                                          },
                                        ),

                                        TextFormField(
                                          maxLength: 50,
                                          decoration: const InputDecoration(
                                            hintText: 'Enter your description',
                                            labelText: 'Task Description',
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty || value.length < 5) {
                                              return "Add more details";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _taskBody = value!;
                                          },
                                        ),

                                        // 2. THE "FAKE" DROPDOWN
                                        TextFormField(
                                          controller: priorityController, // Use the new controller
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                            hintText: 'Set your Priority',
                                            labelText: 'Task Priority',
                                          ),
                                          onTap: () {
                                            // Dismiss any keyboard
                                            FocusScope.of(context).unfocus();
                                            // Show the simple option sheet
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (ctx) {
                                                return Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: Priority.values.map((p) {
                                                    return ListTile(
                                                      title: Text(p.pTitle),
                                                      onTap: () {
                                                        // 3. THIS IS THE LOGIC
                                                        // Just update the variable and
                                                        // let the builder re-run.
                                                        modalSetState(() {
                                                          _selectedPriority = p;
                                                        });
                                                        Navigator.pop(ctx);
                                                      },
                                                    );
                                                  }).toList(),
                                                );
                                              },
                                            );
                                          },
                                        ),

                                        SizedBox(height: 22),

                                        // ... Your "Add Task" Button (no change) ...
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 30.0),
                                          child: FilledButton(
                                            onPressed: () {
                                              if (_formGlobalKey.currentState!.validate()) {
                                                _formGlobalKey.currentState!.save();
                                                addTask();
                                                _formGlobalKey.currentState!.reset();
                                                Navigator.pop(context);
                                              }
                                            },
                                            style: FilledButton.styleFrom(
                                              backgroundColor:
                                              Theme.of(context).appBarTheme.backgroundColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            child: Text(
                                              'Add Task',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .appBarTheme
                                                    .foregroundColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
