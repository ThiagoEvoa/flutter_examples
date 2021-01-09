import 'package:flutter/foundation.dart';

class CounterValueNotifier {
  final counter = ValueNotifier<int>(0);

  increment() {
    counter.value++;
  }
}
