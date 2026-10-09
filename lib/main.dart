import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: const Field(),
    );
  }
}

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

class Todo{
  Todo(this.title, {this.done = false});
  final String title;
  bool done;
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

class TodoInput extends StatefulWidget{
  const TodoInput({super.key, required this.onAdd});
  final void Function(String title) onAdd;

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final TextEditingController _controller = TextEditingController();

  final ButtonStyle style = TextButton.styleFrom(
    textStyle:const TextStyle(fontSize: 20),
  );

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: .min,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
          ),
        ),
        TextButton(
            style: style,
            onPressed: () {
              final title = _controller.text.trim();
              if(_controller.text.trim().isEmpty) return;
              widget.onAdd(title);
              _controller.clear();
            },
            child: const Text('追加'),
          ),
      ],
    );
  }
}

class TodoListView extends StatelessWidget{
  const TodoListView({super.key, required this.todos, required this.onDone});
  final List<Todo> todos;
  final void Function(Todo todo) onDone;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: .min,
      children: [
        for (final i in todos)
          Row(
            children: [
              if (i.done == true) Text('〇') 
              else Text('×'),
              Expanded(child: Text('${i.title}'),),
              TextButton(
                onPressed: () => onDone(i),
                child: const Text('完了'),
              ),
            ],
          ),
      ],
    );
  }
}