import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:todoey/models/taskModal.dart';

class TaskData extends ChangeNotifier {
  final taskBox = Hive.box('tasks');

  // List<TaskModal> _task = [
  //   TaskModal(taskName: 'buy Milk'),
  //   TaskModal(taskName: 'buy clothes'),
  //   TaskModal(taskName: 'buy fruits'),
  // ];
  //
  // UnmodifiableListView<TaskModal> get task {
  //   return UnmodifiableListView(_task);
  // }

  int get taskCount {
    return Hive.box('tasks').length;
  }

  void addTask(String newTask) {
    Hive.box('tasks').add(newTask);
    // final adder = TaskModal(taskName: newTask);
    // _task.add(adder);
    notifyListeners();
  }

  void updateCheckBox(TaskModal task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(TaskModal task) {
    // _task.remove(task);
    notifyListeners();
  }
}
