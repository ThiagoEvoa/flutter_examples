import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/app/main_screen/screen/main_screen.dart';
import 'package:myapp/core/util/navigation_util.dart';
import 'package:myapp/core/util/screen_util.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  void _openMainScreen() {
    pushReplacement(context: context, screen: MainScreen());
  }

  void _onLoaded(LottieComposition composition) {
    _animationController
      ..duration = composition.duration
      ..forward().then(
        (_) => _openMainScreen(),
      );
  }

  @override
  void initState() {
    fullScreen();
    _animationController = AnimationController(vsync: this, upperBound: 0.2);
    super.initState();
  }

  @override
  void dispose() {
    normalScreen();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Lottie.asset(
          'assets/lottie/pokeball_white.json',
          controller: _animationController,
          onLoaded: _onLoaded,
        ),
      ),
    );
  }
}
