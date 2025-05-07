import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({required this.bmiResult, super.key});

  final int bmiResult;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var imagePath = 'Normal';

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    var bmi = widget.bmiResult;
    if (bmi < 18) {
      setState(() {
        bmiColor = Colors.lightBlueAccent;
        bmiText = 'Underweight';
        imagePath = 'underweight';
      });
    } else if (bmi >= 18 && bmi <= 25) {
      setState(() {
        bmiColor = Colors.green;
        bmiText = 'Normal';
        imagePath = 'normal';
      });
    } else if (bmi > 25 && bmi <= 30) {
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'Overweight';
        imagePath = 'overweight';
      });
    } else if (bmi > 30 && bmi <= 35) {
      setState(() {
        bmiColor = Colors.orange;
        bmiText = 'Obese';
        imagePath = 'obese';
      });
    } else if (bmi >= 36) {
      setState(() {
        bmiColor = Colors.red;
        bmiText = 'ExtremeObese';
        imagePath = 'extreme';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlueColour,
      appBar: AppBar(elevation: 1, backgroundColor: darkBlueColour),
      body: Column(
        children: [
          Container(
            width: width,
            height: 190,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Your BMI value is",
                  style: textStyle.copyWith(fontSize: 30),
                ),
                Text("${widget.bmiResult}", style: numTextStyle),
                Text(bmiText, style: textStyle.copyWith(color: bmiColor)),
              ],
            ),
          ),
          Image.asset('images/$imagePath.png', height: height * 0.53),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 55,
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Calculate Again",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
