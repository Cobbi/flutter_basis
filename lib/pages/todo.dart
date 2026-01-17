import 'package:flutter/material.dart';
import 'package:learnflutter/util/todo_title.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List todoList = [
    ["Buy groceries", false],
    ["Walk the dog", false],
    ["Read a book", false],
    ["Exercise", false],
    ["Call a friend", false],
  ];

  void checkBoxChnged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("TODO"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            title: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChnged(value, index),
          );
        },
      ),
    );
  }
}
