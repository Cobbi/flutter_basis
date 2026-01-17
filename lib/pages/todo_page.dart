import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController todoController = TextEditingController();

  void userGreet() {
    final String todoText = todoController.text.trim();

    if (todoText.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Todo Added'),
          content: Text('You added: $todoText'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    todoController.clear();
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Todo List App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter todo',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: userGreet,
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
