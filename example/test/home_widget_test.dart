import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

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