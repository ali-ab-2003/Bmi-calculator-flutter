import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_child_content.dart';
import 'reusable_card.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator.dart';

const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1E33);
const numberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: cardChildContent(
                      buttonIcon: FontAwesomeIcons.mars,
                      buttonText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: cardChildContent(
                      buttonIcon: FontAwesomeIcons.venus,
                      buttonText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn1',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              shape: CircleBorder(),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10.0),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              shape: CircleBorder(),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn3',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              shape: CircleBorder(),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10.0),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              shape: CircleBorder(),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            ButtonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
