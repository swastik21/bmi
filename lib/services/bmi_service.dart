import 'dart:math';
import 'package:flutter/material.dart';

class Bmi extends ChangeNotifier {
  double _bmi = 0.0;
  String _status = '';
  Color _statusColor = Colors.yellow;
  bool _isPressed = false;

  double get bmi => _bmi;
  String get status => _status;
  Color get statuscolor => _statusColor;
  bool get isPressed => _isPressed;

  List<dynamic> result(value) {
    if (value <= 18.4) {
      return ["UnderWeight!", Colors.orange.shade700];
    } else if (value >= 18.5 && value <= 24.9) {
      return ["Normal", Colors.green];
    } else if (value >= 25.0 && value <= 39.0) {
      return ["Overweight!", Colors.orange.shade700];
    } else {
      return ["Obese!!!", Colors.red];
    }
  }

  void calculate(h, w) {
    if (h == "" || w == "") {
      _bmi = 0;
    } else {
      _bmi = double.parse(w) / pow((double.parse(h) / 3.281), 2) + 1.1;
      _status = result(double.parse(_bmi.toStringAsFixed(1)))[0];
      _statusColor = result(double.parse(_bmi.toStringAsFixed(1)))[1];
    }
    notifyListeners();
  }

  void press() {
    _isPressed = !isPressed;
    notifyListeners();
  }
}
