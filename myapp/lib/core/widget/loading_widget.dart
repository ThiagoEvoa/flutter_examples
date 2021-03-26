import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatefulWidget {
  final double size;

  const LoadingWidget({Key key, this.size = 40}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/pokeball.json',
      height: widget.size,
      width: widget.size,
      repeat: true,
    );
  }
}
