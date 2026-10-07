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
        // child: Text('test'),
        child: const Button(),
      ),
    );
  }
}

class Todo{
  Todo(this.title, {this.done = false});
  final String title;
  bool done;
}

class Button extends StatefulWidget{
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button>{
  List<Todo> _todo = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final ButtonStyle style = TextButton.styleFrom(
      textStyle:const TextStyle(fontSize: 20),
      
    );
    
    return Column(
      mainAxisSize: .min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
              ),
            ),
            TextButton(
              style: style,
              onPressed: () => setState((){
                if(_controller.text.isEmpty) return;
                _todo.add(Todo(_controller.text, done: false));
                _controller.clear();
              }),
              child: const Text('追加'),
            ),
          ],
        ),
        for (final i in _todo)
          Text('${i.title}')
        
      ],
    );
  }
}