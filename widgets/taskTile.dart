import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isOn;
  final String taskTitle;
  final Function isCheckBoxCalled, isToDeleteTask;

  TaskTile(
      {this.isOn, this.taskTitle, this.isCheckBoxCalled, this.isToDeleteTask});

  // void isOnFun(bool value) {
  //   setState(() {
  //     isOn = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final String hippy = taskTitle;
    return ListTile(
      title: Text(
        hippy,
        style: TextStyle(decoration: isOn ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isOn,
        onChanged: isCheckBoxCalled,
        checkColor: Colors.white,
        activeColor: Colors.lightBlueAccent,
      ),
      // trailing: TaskCheckBox(
      //   checkBoxState: isOn,
      //   isOnCheck: isOnFun,
      // ),
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function isOnCheck;
//
//   const TaskCheckBox({this.checkBoxState, this.isOnCheck});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       onChanged: isOnCheck,
//       checkColor: Colors.white,
//       activeColor: Colors.lightBlueAccent,
//     );
//   }
// }
