import 'package:flutter/material.dart';
import 'dart:async';

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
        title: const Text('カウンター'),
      ),
      body: Center(
        child: const TodoPage(),
      ),
    );
  }
}

class Todo{
  Todo(this.title, {this.done = false});
  final String title;
  bool done;
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
        Expanded(
          child: TextButton(
            style: style,
            onPressed: () => setState((){
              final title = _controller.text.trim();
              if(_controller.text.isEmpty) return;
              widget.onAdd(title);
              _controller.clear();
            }),
            child: const Text('追加'),
          ),
        )
      ],
    );
  }
}

class TodoListView extends StatelessWidget{
  const TodoListView({super.key, required this.todos, required this.onData});
  final List<Todo> todos;
  final void Function(Todo todo) onData;

  @override
  Widget build(BuildContext context){
    final ButtonStyle style = TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );
    return Column(
      mainAxisSize: .min,
      children: [
        for (final i in todos)
          Row(
            children: [
              if (i.done == true) Text('〇') 
              else Text('×'),
              Text('${i.title}'),
            ],
          ),
      ],
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
          TodoListView(todos: _todo, onData: _markDone),
        ],
      ),
    );
  }
}

// class Button extends StatefulWidget{
//   const Button({super.key});

//   @override
//   State<Button> createState() => _ButtonState();
// }

// class _ButtonState extends State<Button>{
//   List<Todo> _todo = [];
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void dispose(){
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context){
//     final ButtonStyle style = TextButton.styleFrom(
//       textStyle:const TextStyle(fontSize: 20),
//     );
    
//     return Column(
//       mainAxisSize: .min,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _controller,
//               ),
//             ),
//             TextButton(
//               style: style,
//               onPressed: () => setState((){
//                 if(_controller.text.isEmpty) return;
//                 _todo.add(Todo(_controller.text, done: false));
//                 _controller.clear();
//               }),
//               child: const Text('追加'),
//             ),
//           ],
//         ),
//         for (final i in _todo)
//           Center(
//             child: 
//             Row(
//             children: [
//               if (i.done == true) Text('〇') 
//               else Text('×'),
//               Text('${i.title}'),
//               TextButton(
//                 style: style,
//                 onPressed: () => setState(() => i.done = true),
//                 child: const Text('done'),  
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }