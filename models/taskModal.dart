import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'taskModal.g.dart';

@HiveType(typeId: 01)
class TaskModal {
  @HiveField(0)
  final taskName;
  @HiveField(1)
  bool isDone;

  TaskModal({@required this.taskName, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  } // to toggle tasks
}
