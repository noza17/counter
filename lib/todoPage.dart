import 'package:flutter/material.dart';
import 'models/todo.dart';
import 'todoInput.dart';
import 'todoView.dart';

class Field extends StatelessWidget{
  const Field({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoリスト'),
      ),
      body: Center(
        child: const TodoPage(),
      ),
    );
  }
}

class TodoPage extends StatefulWidget{
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState(); 
}

class _TodoPageState extends State<TodoPage>{
  List<Todo> _todo = [];

  void _addTodo(String title){
    setState(() => _todo.add(Todo(title)));
  }

  void _markDone(Todo todo){
    setState(() => todo.done = true);
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TodoInput(onAdd: _addTodo),
          TodoListView(todos: _todo, onDone: _markDone),
        ],
      ),
    );
  }
}