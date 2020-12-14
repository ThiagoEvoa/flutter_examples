import 'package:example/core/util/navigation.dart';
import 'package:example/person/view/screen/people_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation<double> _fadeAnimation;
  AnimationController _fadeController;

  _goToLoginPage() {
    Future.delayed(Duration(seconds: 3)).then(
      (_) => pushReplace(
        context: context,
        screen: PeopleScreen(),
      ),
    );
  }

  @override
  void initState() {
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    _fadeController.forward().then((_) => _goToLoginPage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
