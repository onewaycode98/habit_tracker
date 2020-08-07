import 'package:flutter/material.dart';
import 'package:habit_tracker/colors.dart';
import 'package:habit_tracker/models/habit_data.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/models/task_data.dart';
import 'package:provider/provider.dart';

class HabitsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitsData>(builder: (context, habitsData, child) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: habitsData.habits.length,
          itemBuilder: (context, index) {
            final habits = habitsData.habits[index];
            return Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, bottom: 30.0, right: 15.0),
              child: Container(
                height: 120.0,
                width: 140.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: kFirstGreenColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          habits.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                ),
              ),
            );
          });
    });
  }
}
