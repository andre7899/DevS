import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier {
  double _counter;

  double get counter => this._counter;
  set counter(double value) => this._counter = value;

  ContadorProvider(this._counter);

  void increment() {
    _counter += 10;
    notifyListeners();
  }

  void decrement() {
    _counter -= 10;
    notifyListeners();
  }
}
