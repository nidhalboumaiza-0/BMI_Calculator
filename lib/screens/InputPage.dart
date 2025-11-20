import 'package:bmi_calculator/BMIBrain.dart';
import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componens/icon_content.dart';
import '../componens/reusable_card.dart';
import '../constants.dart';
import '../componens/RoundIconButton.dart';

enum Gender { Male, Female, nulll }

//enum WeightButton { plus, minus }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.nulll;
  int height = 180;
  int weight = 60;
  int age = 20;

  int add() {
    return height = height + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusabelCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                          print(selectedGender);
                        });
                      },
                      colour: selectedGender == Gender.Male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusabelCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                          print(selectedGender);
                        });
                      },
                      colour: selectedGender == Gender.Female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusabelCard(
                      onPress: () {},
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: numbersTextStyle,
                              ),
                              Text(
                                'cm',
                                style: labelTextStyle,
                              )
                            ],
                          ),
                          Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 250,
                            activeColor: Color(0xffeb1555),
                            inactiveColor: Color(0xff8d8e98),
                            onChanged: (double newVal) {
                              setState(() {
                                height = newVal.round();
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
                children: <Widget>[
                  Expanded(
                    child: ReusabelCard(
                      onPress: () {},
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT'),
                          Text(
                            weight.toString(),
                            style: numbersTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressAction: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              RoundIconButton(
                                onPressAction: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusabelCard(
                      onPress: () {},
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numbersTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressAction: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              RoundIconButton(
                                onPressAction: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedGender == Gender.nulll) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weight, height: height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => resultsPage(
                        BMIResult: calc.calculateBMI(),
                        interpretation: calc.gerInterpretation(),
                        resultText: calc.getResult(),
                      ),
                    ),
                  );
                }
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
                  child: Text('CALCULATE YOUR BMI'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
