import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'screens/InputPage.dart';
import 'BMIBrain.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xff0A0D22)),
        primaryColor: Color(0xff0A0D22),
        scaffoldBackgroundColor: Color(0xff0A0D22),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}
