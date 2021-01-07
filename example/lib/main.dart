import 'package:example/first_page.dart';
import 'package:example/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _data;
  bool _shouldReplace;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
        onPopPage: (Route<dynamic> route, dynamic result) {
          if (!route.didPop(result)) return false;
          setState(() {
            _data = null;
          });
          return true;
        },
        pages: [
          MaterialPage(
            key: ValueKey('FirstPage'),
            maintainState: false,
            child: FirstPage(
              onPressed: (value, shoulReplace) {
                setState(() {
                  _data = value;
                  _shouldReplace = shoulReplace;
                });
              },
            ),
          ),
          if (_data != null)
            MaterialPage(
              key: ValueKey('SecondPage'),
              child: SecondPage(
                data: _data,
                shouldReplace: _shouldReplace,
              ),
            ),
        ],
      ),
    );
  }
}
