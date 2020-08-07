import 'package:flutter/material.dart';
import 'package:habit_tracker/colors.dart';
import 'package:habit_tracker/models/task_data.dart';

class TaskTile extends StatefulWidget {
  String name;
  bool isChecked;
  Function checkboxCallback;
  TaskTile({this.name, this.isChecked, this.checkboxCallback});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isChecked,
      checkColor: Colors.white,
      activeColor: kFirstGreenColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        widget.name.toString(),
        style: TextStyle(
            color: widget.isChecked ? Colors.grey.shade400 : Colors.black87,
            decoration: widget.isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      onChanged: widget.checkboxCallback,
    );
  }
}
