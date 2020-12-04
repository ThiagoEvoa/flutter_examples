# Unit Test

> To write a unit test you should create a file with a main function, in order to execute the test functions. And you have two options to write the test functions.

> 1 - First you can group the test functions by the usecase using the keyword 'group' and then specifying the group name and a callback function. Now you can write the test functions using the keyword 'test' and then specifying the test expected cenario and a callback function.

> 2 - You can just write the test functions separatly using the keyword 'test' and then specifying the test expected cenario and a callback function.

### Main
```dart
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
```
