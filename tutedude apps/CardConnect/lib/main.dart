import 'package:cardconnect/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CardConnect());
}

class CardConnect extends StatelessWidget {
  const CardConnect({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
