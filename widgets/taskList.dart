import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/taskData.dart';
import 'package:todoey/models/taskModal.dart';
import 'package:todoey/widgets/taskTile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (ctx, taskData, child) => ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (ctx, index) {
            var taskBoxGetter = taskData.taskBox.get(index) as TaskModal;
            return TaskTile(
              taskTitle: taskBoxGetter.taskName,
              //taskData.task[index].taskName,
              isOn: taskBoxGetter.isDone,
            );
          }),
    );
  }
}

// return ListView(
// children: [
// SizedBox(
// height: 30,
// ),
// TaskTile(
// taskTitle: task[0].taskName,
// isOn: task[0].isDone,
// ),
// TaskTile(
// taskTitle: task[1].taskName,
// isOn: task[1].isDone,
// ),
// TaskTile(
// taskTitle: task[2].taskName,
// isOn: task[2].isDone,
// ),
// SizedBox(
// height: 50,
// ),
// ],
// );
