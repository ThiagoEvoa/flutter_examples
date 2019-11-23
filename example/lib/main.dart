import 'package:example/firebase_auth_service.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    _log() {
      FirebaseAuthService()
          .sign(email: _emailController.text, password: _emailController.text)
          .then(
        (result) {
          setState(() {
            _result = 'Yeah, we made it!';
          });
        },
      ).catchError(
        (error) {
          setState(() {
            _result = error.message;
          });
        },
      );
    }

    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            RaisedButton(
              onPressed: _log,
              child: Text('Sign'),
            ),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
