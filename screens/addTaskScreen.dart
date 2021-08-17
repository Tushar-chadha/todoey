import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/taskData.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;

  AddTaskScreen({this.addTaskCallBack});

  @override
  Widget build(BuildContext context) {
    String newTask;
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                print(newTask);
                newTask = newValue;
              },
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
