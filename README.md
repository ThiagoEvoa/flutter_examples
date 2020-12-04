# Unit Test

> To write a unit test you should create a file with a main function, in order to execute the test functions. And you have two options to write the test functions.

> 1 - First you can group the test functions by the usecase using the keyword 'group' and then specifying the group name and a callback function. Now you can write the test functions using the keyword 'testWidgets' and then specifying the test expected cenario and a async callback function with a WidgetTester parameter.

> 2 - You can just write the test functions separatly using the keyword 'testWidgets' and then specifying the test expected cenario and a async callback function with a WidgetTester parameter.

> To run the tests you cam just hit the Run | Debug option in the IDE, or in the terminal you can execute the command 'flutter test test/{file_name}.dart to execute the tests on a specific file or just 'flutter test' to execute all tests.

### Main
```dart
void main() {
  group('MyHomePage', () {
    testWidgets('Counter value should initiate with 0',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Counter value should increse from 0 to 1',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.tap(find.byKey(Key('increment_button')));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
```
