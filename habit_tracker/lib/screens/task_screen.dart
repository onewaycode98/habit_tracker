import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/add_task_screen.dart';
import 'package:habit_tracker/style.dart';
import 'package:habit_tracker/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:habit_tracker/colors.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Today\'s tasks', style: kHeaderTextStyle),
            Expanded(child: TaskList())
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: kFirstGreenColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
