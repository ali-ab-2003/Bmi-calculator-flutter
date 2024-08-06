import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  resultText,
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0), // Add padding here
                    child: Text(
                      interpretation.toUpperCase(),
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              ButtonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
