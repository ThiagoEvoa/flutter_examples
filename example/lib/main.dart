import 'package:example/uppercase_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s'))
              ],
              decoration: InputDecoration(hintText: 'Not allow space'),
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s'))
              ],
              decoration: InputDecoration(hintText: 'Only letters and space'),
            ),
            TextField(
              maxLength: 6,
              inputFormatters: [
                UpperCaseTextFormatter(),
                FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
              ],
              decoration:
                  InputDecoration(hintText: 'Only uppercase and number'),
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              decoration: InputDecoration(hintText: 'Amount input'),
            ),
          ],
        ),
      ),
    );
  }
}
