import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:todoey/models/taskData.dart';
import 'package:todoey/models/taskModal.dart';
import 'package:todoey/screens/taskScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // to ensure plugin is initialized
  final appDocumentDir = await path_provider
      .getApplicationDocumentsDirectory(); // to get path of the directory
  Hive.init(appDocumentDir
      .path); // initializing hive in main directory before any operation.
  Hive.registerAdapter<TaskModal>(TaskModalAdapter());
  await Hive.openBox('tasks');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Hive.box('tasks');
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: FutureBuilder(
          future: Hive.openBox('tasks'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return TaskScreen();
            } else
              return Scaffold(
                body: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
