import 'package:bmi_calculator/componens/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class resultsPage extends StatelessWidget {
  resultsPage(
      {required this.BMIResult,
      required this.interpretation,
      required this.resultText});

  final String BMIResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: labelTextStyle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Your Result',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: ReusabelCard(
                colour: activeCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      BMIResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: bottomContainerColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: bottomContainerHeight,
                child: Center(
                  child: Text('RE-CALCULATE YOUR BMI'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
