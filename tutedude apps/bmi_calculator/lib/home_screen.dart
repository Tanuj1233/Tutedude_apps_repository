import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int heightSlider = 120;
  int age = 25;
  int weight = 45;
  Color maleColour = Color(0xff033e66);
  Color femaleColour = Color(0xff033e66);

  void calculateBMI() {
    var heightInMetter = heightSlider / 100;
    var bmi = weight / (heightInMetter * heightInMetter);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(bmiResult: bmi.round(),),
      ),
    );
  }

  void selectGender(bool gender) {
    if (gender) {
      setState(() {
        maleColour = blueColor;
        femaleColour = selectedColor;
      });
    } else {
      setState(() {
        femaleColour = blueColor;
        maleColour = selectedColor;
      });
    }
  }

  addSubAge(bool ageAdd) {
    if (ageAdd) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        age--;
      });
    }
  }

  addSubWeight(bool weightAdd) {
    if (weightAdd) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColour,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: darkBlueColour,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  //* Male button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(true);
                        });
                      },
                      child: ReusableCard(
                        color: maleColour,
                        cardChild: Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FaIcon(
                                  FontAwesomeIcons.mars,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Male", style: textStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //* Female button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(false);
                        });
                      },
                      child: ReusableCard(
                        color: femaleColour,
                        cardChild: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FaIcon(
                                FontAwesomeIcons.venus,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Female", style: textStyle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //* Height slider
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: blueColor,
                      cardChild: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Height", style: textStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                heightSlider.toString(),
                                style: numTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("cm", style: numTextStyle),
                              ),
                            ],
                          ),
                          Slider(
                            min: 120,
                            max: 200,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white70,
                            thumbColor: Colors.pink,
                            // thumbShape: RoundSliderThumbShape(
                            //   enabledThumbRadius: 15,
                            // ),
                            value: heightSlider.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                heightSlider = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  //* Age adjustment button
                  Expanded(
                    child: ReusableCard(
                      color: blueColor,
                      cardChild: Column(
                        children: [
                          Text("Age", style: textStyle),
                          Text(age.toString(), style: numTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      addSubAge(true);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      addSubAge(false);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //* Weight adjustment button
                  Expanded(
                    child: ReusableCard(
                      color: blueColor,
                      cardChild: Column(
                        children: [
                          Text("Weight", style: textStyle),
                          Text(weight.toString(), style: numTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      addSubWeight(true);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      addSubWeight(false);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          //* Calculate button
            GestureDetector(
              onTap: () {
                calculateBMI();
              },
              child: Container(
                height: 55,
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Calculate BMI",
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
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.color, required this.cardChild, super.key});

  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({required this.icon, required this.onPressed, super.key});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      shape: const CircleBorder(),
      fillColor: selectedColor,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon, color: Colors.white),
    );
  }
}
