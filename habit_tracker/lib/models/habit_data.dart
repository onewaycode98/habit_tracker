import 'package:flutter/material.dart';
import 'habit.dart';

class HabitsData extends ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits {
    return _habits;
  }

  void addHabit(String newHabitTitle) {
    final habit = Habit(name: newHabitTitle);
    _habits.add(habit);
    notifyListeners();
  }
}
