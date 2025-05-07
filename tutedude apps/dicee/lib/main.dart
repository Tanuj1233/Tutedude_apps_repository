import 'package:dice/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Dicee());
}

class Dicee extends StatelessWidget {
  const Dicee({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
