import 'package:flutter/material.dart';

class Task {
  String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  Function toggleDone() {
    isDone = !isDone;
  }
}
