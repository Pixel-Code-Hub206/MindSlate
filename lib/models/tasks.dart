import 'package:flutter/material.dart';

enum Priority{
  urgent(color: Colors.red, pTitle: 'Urgent'),  //Priority defined in the form of a Priority instance
  high(color: Colors.orange, pTitle: 'High'),
  medium(color: Colors.yellow, pTitle: 'Medium'),
  low(color: Colors.green, pTitle: 'Low');

 final Color color;
 final String pTitle;

  const Priority({required this.color, required this.pTitle});
}

class Tasks{
  String isTitle = "";
  String isBody = "";
  bool isDone = false;
  Priority priority;  //Saving custom priorities in an instance of the Priority object names priority

  Tasks({required this.isTitle, required this.isBody, required this.priority, required this.isDone}); //Labelled parameter using braces {}

  void toggleDone()
  {
    isDone = !isDone; //Changed false to true and Vice Versa
  }
}