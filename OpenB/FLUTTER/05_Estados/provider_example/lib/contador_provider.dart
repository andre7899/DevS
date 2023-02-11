import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier {
  int _counter;

  int get counter => this._counter;
  set counter(int value) => this._counter = value;

  ContadorProvider(this._counter);

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
