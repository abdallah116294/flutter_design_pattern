import 'package:flutter/material.dart';

class NumberGenerator {
  //private constructor
  NumberGenerator._internal() {
    debugPrint("<Generator number>creation");
  }
  //static instance
  static NumberGenerator _instnce = NumberGenerator._internal();
  //factory constructor return the instance
  factory NumberGenerator() {
    return _instnce;
  }
  int _currentNumber = 0;
  int getNextNumber() {
    _currentNumber++;
    return _currentNumber;
  }
}
