import 'package:clima/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Climate());
}

class Climate extends StatelessWidget {
  const Climate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
