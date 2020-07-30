import 'package:flutter/material.dart';
import 'task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return _tasks;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
}
