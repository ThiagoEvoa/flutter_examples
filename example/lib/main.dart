import 'dart:math';

import 'package:example/second.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _fadeController;
  AnimationController _rotateController;
  Animation<double> _fadeAnimation;
  Animation<double> _rotateAnimation;

  @override
  void initState() {
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _rotateAnimation =
        Tween(begin: 0.0, end: 1 * pi).animate(_rotateController);

    _fadeController.forward().then((_) {
      _rotateController.forward();
    });

    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Second()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Hero(
          tag: 'logo',
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: AnimatedBuilder(
                    animation: _rotateAnimation,
                    builder: (context, widget) {
                      return Transform.rotate(
                          angle: _rotateAnimation.value, child: widget);
                    },
                    child: FlutterLogo(
                      size: 300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
