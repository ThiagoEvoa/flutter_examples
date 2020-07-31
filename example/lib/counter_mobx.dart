import 'package:mobx/mobx.dart';

class CounterMobx {
  CounterMobx() {
    increment = Action(_increment);
  }

  final _value = Observable(0);
  Action increment;

  int get value => _value.value;
  set value(int newValue) => _value.value = newValue;

  _increment() {
    _value.value++;
  }
}
