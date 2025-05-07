import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDice = 6;
  int rightDice = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DICEE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'Pangolin',
          ),
        ),
        backgroundColor: Colors.red[500],
      ),
      backgroundColor: Colors.red[500],
      body: GestureDetector(
        onTap: () {
          var random1 = Random().nextInt(5) + 1;
          var random2 = Random().nextInt(5) + 1;
          setState(() {
            leftDice = random1;
            rightDice = random2;
          });
        },
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/dice$leftDice.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/dice$rightDice.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
