import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/colors.dart';
import 'package:habit_tracker/style.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _newTaskTitle = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
            SizedBox(height: 20.0),
            Text(
              'Create new task',
              style: kHeaderTextStyle,
            ),
            SizedBox(height: 30.0),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter name task';
                  }
                  return null;
                },
                controller: _newTaskTitle,
                cursorColor: kFirstGreenColor,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black87)),
              ),
            ),
            SizedBox(height: 30.0),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.white,
              onTap: () {
                if (_formKey.currentState.validate()) {
                  Provider.of<TasksData>(context, listen: false)
                      .addTask(_newTaskTitle.text);
                  Navigator.pop(context);
                }
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
