import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class Task {
  Task(
      {@required this.taskTitle,
      //1 -> cheacked , 0->not checked
      this.taskIsChecked = 0,
      this.taskReminderDate,
      this.taskId});

  final String taskTitle;
  int taskIsChecked;
  final DateTime taskReminderDate;
  final int taskId;

  void toggleCheck() {
    if (taskIsChecked == 0)
      taskIsChecked = 1;
    else if (taskIsChecked == 1) taskIsChecked = 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'taskTitle': taskTitle,
      'taskIsChecked': taskIsChecked,
      "taskReminderDate":
          taskReminderDate != null ? taskReminderDate.toString() : null,
      'taskId': taskId,
    };
  }
}
