import 'package:example/counter_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterProvider', () {
    CounterProvider counter = CounterProvider();

    test('Counter value should initiate with 0', () {
      expect(counter.getCounter, 0);
    });

    test('Counter value should increse from 0 to 1', () {
      counter.incrementCounter();
      expect(counter.getCounter, 1);
    });
  });
}
