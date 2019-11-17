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
  Future<void> _generalDialog() async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(seconds: 3),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        var fadeTween = CurveTween(curve: Curves.fastOutSlowIn);
        var fadeAnimation = fadeTween.animate(animation);
        return FadeTransition(
          opacity: fadeAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          title: Text("GeneralDialog"),
          content: Text("GeneralDialog example"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RaisedButton(
          onPressed: _generalDialog,
          child: Text('Show'),
        ),
      ),
    );
  }
}
