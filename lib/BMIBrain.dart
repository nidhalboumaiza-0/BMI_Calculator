import 'dart:core';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int height;
  final int weight;

  double _bmi = 0;
  calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  gerInterpretation() {
    if (_bmi >= 25) {
      return 'You have a heighter than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job ! ';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
