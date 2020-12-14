import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';

class CounterProvider extends StateNotifier<int> {
  CounterProvider() : super(0);

  incrementCounter() {
    state++;
  }
}
