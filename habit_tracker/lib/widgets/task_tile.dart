import 'package:flutter/material.dart';
import 'package:habit_tracker/colors.dart';

class TaskTile extends StatefulWidget {
  String name;
  TaskTile({this.name});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _checked = false;
  Color textColor;
  TextDecoration textDecoration;

  void changeTextColor() {
    if (_checked == true) {
      textColor = Colors.black87;
      textDecoration = TextDecoration.none;
    } else {
      textColor = Colors.grey.shade400;
      textDecoration = TextDecoration.lineThrough;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _checked,
      checkColor: Colors.white,
      activeColor: kFirstGreenColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        widget.name,
        style: TextStyle(color: textColor, decoration: textDecoration),
      ),
      onChanged: (bool value) {
        setState(() {
          changeTextColor();
          _checked = value;
        });
      },
    );
  }
}
