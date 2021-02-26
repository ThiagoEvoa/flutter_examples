import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Lottie.asset(
          'assets/lottie/animation.json',
          controller: _animationController,
          onLoaded: (composition) {
            _animationController = AnimationController(
              vsync: this,
              duration: composition.duration,
            );
            _animationController..forward();
          },
        ),
      ),
    );
  }
}
