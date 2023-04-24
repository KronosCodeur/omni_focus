import 'package:flutter/material.dart';
import 'package:omni_focus/providers/task_provider.dart';
import 'package:omni_focus/screens/add_task_screen.dart';
import 'package:omni_focus/screens/taks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskState(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: TasksScreen.routeName,
      routes: {
        AddTaskScreen.routeName: (_) => AddTaskScreen(),
        TasksScreen.routeName: (_) => TasksScreen(),
      },
    );
  }
}
