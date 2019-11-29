import 'package:example/sex_enum.dart';
import 'package:flutter/material.dart';

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
  SexEnum _sexEnum = SexEnum.male;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Sex:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('male'),
                Radio(
                  value: SexEnum.male,
                  groupValue: _sexEnum,
                  onChanged: (value) {
                    setState(() {
                      _sexEnum = value;
                    });
                  },
                ),
                Text('female'),
                Radio(
                  value: SexEnum.female,
                  groupValue: _sexEnum,
                  onChanged: (value) {
                    setState(() {
                      _sexEnum = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
