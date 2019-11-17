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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _width = 200;
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _width += 100;
              _height += 100;
            });
          },
          onDoubleTap: () {
            setState(() {
              _width -= 100;
              _height -= 100;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            width: _width,
            height: _height,
            child: FlutterLogo(),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
