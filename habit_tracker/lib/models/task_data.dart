import 'package:flutter/material.dart';
import 'task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _checkedTasks = [];

  List<Task> get tasks {
    return _tasks;
  }

  List<Task> get checkedTask {
    return _checkedTasks;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.insert(0, task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
    addTaskToCheckedList(task);
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void addTaskToCheckedList(Task task) {
    if (task.isDone == true) {
      _tasks.insert(_tasks.length, task);
      _tasks.remove(task);
    } else if (task.isDone == false) {
      _tasks.remove(task);
      _tasks.insert(0, task);
    }
  }
}
