import 'package:flutter/material.dart';
import 'models/todo.dart';

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