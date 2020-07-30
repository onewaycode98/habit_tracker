import 'package:flutter/material.dart';
import 'package:habit_tracker/colors.dart';
import 'package:habit_tracker/style.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Create new task',
              style: kHeaderTextStyle,
            ),
            SizedBox(height: 30.0),
            TextField(
              cursorColor: kFirstGreenColor,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black87)),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Provider.of<TasksData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                    color: kFirstGreenColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    'Create',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
