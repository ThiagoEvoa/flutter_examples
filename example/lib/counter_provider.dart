import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterProvider extends StateNotifier<int> {
  CounterProvider() : super(0);

  incrementCounter() {
    state++;
  }
}
