import 'package:hive/hive.dart';
import 'tasks.dart';

class Boxes{
  static Box<Tasks> getTasks() => Hive.box<Tasks>('tasksBox');
}