import 'package:flutter/material.dart';

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