import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[200],
        appBar: AppBar(
          title: const Text('My First App'),
          backgroundColor: Colors.cyan[900],
        ),
        body: Center(
          child: Image.asset(
            'images/owl-2.jpg',
            height: 500,
            width: 500,
          ),
        ),
      ),
    );
  }
}
