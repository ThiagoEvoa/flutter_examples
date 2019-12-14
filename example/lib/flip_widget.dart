import 'dart:math';

import 'package:flutter/material.dart';

class FlipWidget extends StatefulWidget {
  final frontChild;
  final backChild;
  final flipOrientation;

  const FlipWidget(
      {@required this.frontChild,
      @required this.backChild,
      @required this.flipOrientation});

  @override
  _FlipWidgetState createState() =>
      _FlipWidgetState(frontChild, flipOrientation);
}

class _FlipWidgetState extends State<FlipWidget>
    with SingleTickerProviderStateMixin {
  Widget _widget;
  FlipEnum _flipEnum;
  AnimationController _animationController;
  bool _flag = true;
  Color _color = Colors.blue;

  _FlipWidgetState(Widget widget, FlipEnum flipEnum) {
    _widget = widget;
    _flipEnum = flipEnum;
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300), value: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (_flag) {
          await _animationController.reverse();
          setState(() {
            _color = Colors.orange;
            _widget = widget.backChild;
          });
          await _animationController.forward();
        } else {
          await _animationController.reverse();
          setState(() {
            _color = Colors.blue;
            _widget = widget.frontChild;
          });
          await _animationController.forward();
        }

        _flag = !_flag;
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) {
          return Transform(
            transform: _flipEnum == FlipEnum.VERTICAL
                ? Matrix4.rotationX((1 - _animationController.value) * pi / 2)
                : Matrix4.rotationY((1 - _animationController.value) * pi / 2),
            alignment: Alignment.center,
            child: Container(
              width: 400,
              height: 200,
              child: Card(
                color: _color,
                child: Center(child: _widget),
              ),
            ),
          );
        },
      ),
    );
  }
}

enum FlipEnum { HORIZONTAL, VERTICAL }
