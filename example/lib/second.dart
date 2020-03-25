import 'dart:math';

import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> with SingleTickerProviderStateMixin {
  AnimationController _rotateController;
  Animation<double> _rotateAnimation;

  @override
  void initState() {
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _rotateAnimation =
        Tween(begin: 1 * pi, end: 2 * pi).animate(_rotateController);

    _rotateController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Hero(
                tag: 'logo',
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: AnimatedBuilder(
                        animation: _rotateAnimation,
                        builder: (context, widget) {
                          return Transform.rotate(
                              angle: _rotateAnimation.value, child: widget);
                        },
                        child: FlutterLogo(
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
