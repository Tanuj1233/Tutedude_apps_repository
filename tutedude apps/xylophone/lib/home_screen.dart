import 'package:flutter/material.dart';
import 'package:xylophone/common_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidget(color: Colors.red, audioNumber: 1),
          CommonWidget(color: Colors.orange, audioNumber: 2),
          CommonWidget(color: Colors.yellow, audioNumber: 3),
          CommonWidget(color: Colors.green, audioNumber: 4),
          CommonWidget(color: Colors.blue, audioNumber: 5),
          CommonWidget(color: Colors.indigo, audioNumber: 6),
          CommonWidget(color: Colors.pinkAccent, audioNumber: 7),
        ],
      ),
    );
  }
}
