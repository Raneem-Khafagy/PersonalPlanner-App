import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class Task {
  Task(
      {@required this.taskTitle,
      this.taskIsChecked,
      this.taskReminderDate,
      this.taskId});

  final String taskTitle;
  bool taskIsChecked;
  final DateTime taskReminderDate;
  final int taskId;

  void toggleCheck() {
    taskIsChecked = !taskIsChecked;
  }

  Map toJson() => {
        'taskTitle': taskTitle,
        'taskIsChecked': taskIsChecked,
        "taskReminderDate":
            taskReminderDate != null ? taskReminderDate.toString() : null,
        'taskId': taskId,
      };
}
