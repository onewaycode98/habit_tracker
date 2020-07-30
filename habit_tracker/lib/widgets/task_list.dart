import 'package:flutter/material.dart';
import 'package:habit_tracker/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return Dismissible(
            key: Key(taskData.tasks[index].toString()),
            onDismissed: (direction) {
              setState(() {
                taskData.tasks.removeAt(index);
              });
            },
            background: Container(color: Colors.red),
            child: Container(
                height: 60.0,
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0)),
                child: TaskTile(name: task.name)),
          );
        },
      );
    });
  }
}
