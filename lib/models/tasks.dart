import 'package:flutter/material.dart';

enum Priority{
  urgent(color: Color(0XFFFF3232), pTitle: 'Urgent'),  //Priority defined in the form of a Priority instance
  high(color: Color(0xFFFF961E), pTitle: 'High'),
  medium(color: Color(0xFFF4FC17), pTitle: 'Medium'),
  low(color: Color(0xFF3BFF48), pTitle: 'Low');

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