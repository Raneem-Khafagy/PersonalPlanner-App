import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:myplanner/Models/TaskData.dart';

final LocalStorage localStorage = LocalStorage(
  'toDoList.json',
);

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  Future<void> _saveToStorage() async {
    await localStorage.setItem(
        'todos', tasks.map((taskData) => taskData.toJson()).toList());
  }

  Future<void> addTask(Task task, {int index}) async {
    if (index != null) {
      tasks.insert(index, task);
    } else {
      tasks.add(task);
    }
    await _saveToStorage();
    notifyListeners();
  }

  Future<void> toggleCheck(Task task) async {
    task.toggleCheck();
    await _saveToStorage();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    tasks.remove(task);
    await _saveToStorage();
    notifyListeners();
  }

  Future<void> modifyTask(Task original, Task newTask) async {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i] == original) {
        print('Task found at $i');
        tasks[i] = newTask;
        break;
      }
    }

    await _saveToStorage();
    notifyListeners();
  }

  int get taskCount {
    return tasks.length;
  }

  Future<void> init(item) async {
    print(item);
    if (item != null && item.length > 0) {
      tasks.clear();
      for (Map taskData in item) {
        tasks.add(Task(
            taskTitle: taskData['taskTitle'],
            taskIsChecked: taskData['taskIsChecked'],
            taskReminderDate: taskData['taskReminderDate'] != null
                ? DateTime.parse(taskData['reminderDate'])
                : null,
            taskId: taskData['taskId']));
      }
    }
  }
}
