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
    ["Read a book", false],
    ["Exercise", false],
    ["Call a friend", false],
  ];

  void checkBoxChnged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTodo() {
    showDialog(
      context: context,
      builder: (context) {
        String newTodoTitle = '';

        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            onChanged: (value) {
              newTodoTitle = value;
            },
            decoration: const InputDecoration(
                hintText: 'Enter todo title', border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  todoList.add([newTodoTitle, false]);
                });
                Navigator.of(context).pop();
              },
              // style: TextButton.styleFrom(
              //     backgroundColor: Colors.yellow,
              //     foregroundColor: Colors.black,
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 12, vertical: 2)),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void deleteTodo(int index) {
    setState(() {
      todoList.removeAt(index);
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTodo,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            title: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChnged(value, index),
            onDelete: () => deleteTodo(index),
          );
        },
      ),
    );
  }
}
