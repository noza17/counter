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
        title: const Text('カウンター'),
      ),
      body: Center(
        // child: Text('test'),
        child: const Button(),
      ),
    );
  }
}

class Button extends StatefulWidget{
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button>{
  int _count = 0;

  @override
  Widget build(BuildContext context){
    final ButtonStyle style = TextButton.styleFrom(
      textStyle:const TextStyle(fontSize: 20),
      
    );
    
  return Column(
      mainAxisSize: .min,
      children: [
        TextButton(
          style: style,
          onPressed: () => setState(() => _count += 1,),
          child: const Text('加算'),
        ),
        Text('$_count 回'),
      ],
    );
  }
}