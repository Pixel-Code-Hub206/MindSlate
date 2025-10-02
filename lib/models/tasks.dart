import 'package:flutter/material.dart';

class Tasks{
  String isBody = "";
  bool isDone = false;

  Tasks({required this.isBody, required this.isDone}); //Labelled parameter using braces {}

  void toggleDone()
  {
    isDone = !isDone; //Changed false to true and Vice Versa
  }
}