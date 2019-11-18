import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  int _counter;

  CounterProvider(this._counter);

  int get getCounter => _counter;

  incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
