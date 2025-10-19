import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'tasks.g.dart';

enum Priority{
  urgent(color: Color(0XFFFF3232), pTitle: 'Urgent'),  //Priority defined in the form of a Priority instance
  high(color: Color(0xFFFF961E), pTitle: 'High'),
  medium(color: Color(0xFFF4FC17), pTitle: 'Medium'),
  low(color: Color(0xFF3BFF48), pTitle: 'Low');

  final Color color;
  final String pTitle;

  const Priority({required this.color, required this.pTitle});
}

//For converting enum -> String(when saving)
extension PriorityX on Priority{
  String get nameValue => toString().split('.').last;   //Storing the String form of the enum in 'nameValue'
}

//For converting String -> enum(when loading)
Priority priorityFromString(String s){
  return Priority.values.firstWhere(
        (e) => e.nameValue == s,
    orElse: () => Priority.low,
  );
}

@HiveType(typeId: 1)
class Tasks extends HiveObject{
  Tasks({required this.isTitle, required this.isBody, required this.priority, required this.isDone}); //Labelled parameter using braces {}

  @HiveField(0)
  String isTitle;

  @HiveField(1)
  String isBody;

  @HiveField(2)
  String priority;

  @HiveField(3)
  bool isDone;

  void toggleDone()
  {
    isDone = !isDone; //Changed false to true and Vice Versa
    save();
  }
}