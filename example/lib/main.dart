import 'package:example/flip_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlipWidget(
              flipOrientation: FlipEnum.HORIZONTAL,
              frontChild: Text(
                'Front',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              backChild: Text(
                'Back',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            FlipWidget(
              flipOrientation: FlipEnum.VERTICAL,
              frontChild: Text(
                'Front',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              backChild: Text(
                'Back',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
