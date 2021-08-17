import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/taskData.dart';
import 'package:todoey/screens/addTaskScreen.dart';
import 'package:todoey/widgets/taskList.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void openModalSheet(BuildContext ctx) {
    final taskData = Provider.of<TaskData>(context, listen: false);

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        isScrollControlled: true,
        enableDrag: true,
        elevation: 60,
        context: ctx,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: AddTaskScreen(
              addTaskCallBack: (newTitle) {
                setState(() {
                  taskData.addTask(newTitle);
                  Navigator.pop(context);
                });
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          openModalSheet(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 30, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        size: 35,
                        color: Colors.lightBlueAccent,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).taskCount} Tasks left",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
