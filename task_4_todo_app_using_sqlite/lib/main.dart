import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:task_4_todo_app_using_sqlite/home_screen.dart';

void main() => runApp(DevicePreview(builder: (context) => TodoList(),),);

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}


