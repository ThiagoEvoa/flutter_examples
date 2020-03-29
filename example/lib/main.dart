import 'package:example/google_sign.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  GoogleSignService _googleSignService = GoogleSignService();
  GoogleSignInAccount _googleSignInAccount;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _googleSignService.handleSignIn().then((value) {
                  setState(() {
                    _googleSignInAccount = value;
                  });
                });
              },
              color: Colors.blue,
              child: Container(
                width: 190,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'images/google_icon.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Text(
                      'Sign with Google',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[50]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: _googleSignInAccount == null
                  ? Container()
                  : Image.network(_googleSignInAccount.photoUrl),
            ),
          ],
        ),
      ),
    );
  }
}
