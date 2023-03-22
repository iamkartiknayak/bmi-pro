import 'package:flutter/material.dart';
import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;

  BMIBrain({
    required this.height,
    required this.weight,
  });

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You\'ve a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You\'ve a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Color getResultDisplayColor() {
    if (_bmi >= 25) {
      return Colors.red;
    } else if (_bmi > 18.5) {
      return const Color(0xff24d876);
    } else {
      return const Color(0xffe6db74);
    }
  }
}
