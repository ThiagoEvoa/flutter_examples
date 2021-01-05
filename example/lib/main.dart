import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
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
  Tween<Offset> _tween;

  @override
  void initState() {
    _tween = Tween(begin: Offset(0.0, 1), end: Offset(0.0, 0.0));
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _openAndCloseDraggableScrollableSheet(bool shouldOpen) {
      if (shouldOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    return Scaffold(
      appBar: AppBar(
      ),
      body: Stack(
        children: [
          RaisedButton(
            onPressed: () {
              _openAndCloseDraggableScrollableSheet(true);
            },
            child: Text('Open DraggableScrollableSheet'),
          ),
          SlideTransition(
            position: _tween.animate(_controller),
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.0,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  color: Theme.of(context).primaryColor,
                  child: ListView(
                    children: [
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            _openAndCloseDraggableScrollableSheet(false);
                          },
                          child: Text('Close DraggableScrollableSheet'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
