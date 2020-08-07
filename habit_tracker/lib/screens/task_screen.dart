import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/add_habits_screen.dart';
import 'package:habit_tracker/screens/add_task_screen.dart';
import 'package:habit_tracker/style.dart';
import 'package:habit_tracker/widgets/habits_list.dart';
import 'package:habit_tracker/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:habit_tracker/colors.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 30.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Text('My habits', style: kHeaderTextStyle),
                    RawMaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddHabitsScreen()));
                      },
                      fillColor: kFirstGreenColor,
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            Flexible(flex: 3, child: HabitsList()),
            Flexible(
                flex: 1,
                child: Text('Today\'s tasks', style: kHeaderTextStyle)),
            Flexible(flex: 4, child: TaskList()),
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
