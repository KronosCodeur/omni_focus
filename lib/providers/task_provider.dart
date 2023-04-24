import 'package:flutter/material.dart';
import 'package:omni_focus/models/task.dart';

class TaskState extends ChangeNotifier {
  List<Task> listOfAllTasks = [];
  addTask(Task task) {
    listOfAllTasks.add(task);
    notifyListeners();
  }

  removeTask(Task task) {
    listOfAllTasks.remove(task);
    notifyListeners();
  }
}
