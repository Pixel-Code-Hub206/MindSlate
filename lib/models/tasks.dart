import 'package:flutter/material.dart';

class Tasks{
  String isTitle = "";
  bool isDone = false;

  Tasks(this.isTitle, this.isDone);

  void taskToggle()
  {
    isDone = !isDone; //Changed false to true and Vice Versa
  }
}