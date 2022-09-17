import 'dart:math';
import 'package:flutter/material.dart';

class Bmi extends ChangeNotifier {
  double _bmi = 0.0;
  String _status = '';

  double get bmi => _bmi;
  String get status => _status;

  String result(value) {
    if (value <= 18.4) {
      return "UnderWeight";
    } else if (value >= 18.5 && value <= 24.9) {
      return "Normal";
    } else if (value >= 25.0 && value <= 39.0) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  void calculate(h, w) {
    if (h == "" || w == "") {
      _bmi = 0;
    } else {
      _bmi = double.parse(w) / pow((double.parse(h) / 3.281), 2) + 1.1;
      _status = result(double.parse(_bmi.toStringAsFixed(1)));
    }
    notifyListeners();
  }
}
