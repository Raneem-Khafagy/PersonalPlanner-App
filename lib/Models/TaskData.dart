import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class Task {
  Task(
      {@required this.tasktitle,
      this.taskisChecked = false,
      this.taskreminderDate,
      this.taskId});

  final String tasktitle;
  bool taskisChecked;
  final DateTime taskreminderDate;
  final int taskId;

  void toggleCheck() {
    taskisChecked = !taskisChecked;
  }

  // Convert a taskData into a Map. The keys correspondS to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'tasktitle': tasktitle,
      'taskisChecked': taskisChecked,
      "reminderDate":
          taskreminderDate != null ? taskreminderDate.toString() : null,
      'taskId': taskId,
    };
  }
}
