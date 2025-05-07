import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const BmiCalculation());
}

class BmiCalculation extends StatelessWidget {
  const BmiCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
