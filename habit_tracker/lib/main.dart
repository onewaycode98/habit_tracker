import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit_data.dart';
import 'package:habit_tracker/models/task_data.dart';
import 'package:provider/provider.dart';
import 'screens/task_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasksData()),
        ChangeNotifierProvider(create: (context) => HabitsData()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
