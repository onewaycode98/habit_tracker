import 'package:flutter/material.dart';
import 'package:habit_tracker/style.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/models/habit_data.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class AddHabitsScreen extends StatefulWidget {
  @override
  _AddHabitsScreenState createState() => _AddHabitsScreenState();
}

class _AddHabitsScreenState extends State<AddHabitsScreen> {
  TextEditingController _newHabitTitle = TextEditingController();
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
                'Add new habit',
                style: kHeaderTextStyle,
              ),
              SizedBox(height: 30.0),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter name habit';
                    }
                    return null;
                  },
                  controller: _newHabitTitle,
                  cursorColor: kFirstGreenColor,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      labelText: 'Habit name',
                      labelStyle: TextStyle(color: Colors.black87)),
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.white,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    Provider.of<HabitsData>(context, listen: false)
                        .addHabit(_newHabitTitle.text);
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
            ]),
      ),
    );
  }
}
