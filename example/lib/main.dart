import 'dart:math';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _animation = Tween(begin: 0.0, end: 2.0 * pi).animate(_controller);

    return Material(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, widget) {
          return Transform.rotate(
            angle: _animation.value,
            child: widget,
          );
        },
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Material(child: FlutterLogo());
          },
        ),
      ),
    );
  }
}
