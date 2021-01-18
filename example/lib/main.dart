import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

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

class _MyHomePageState extends State<MyHomePage> {
  FacebookLogin _facebookLogin;
  FacebookLoginResult _result;
  String _token;
  dynamic _profile;

  login() async {
    _result = await _facebookLogin.logIn(['email']);

    switch (_result.status) {
      case FacebookLoginStatus.loggedIn:
        {
          _token = _result.accessToken.token;
          Response response = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=picture,name,first_name,last_name,email&access_token=$_token');
          setState(() {
            _profile = json.decode(response.body);
          });
          break;
        }
      case FacebookLoginStatus.cancelledByUser:
        {
          print('Cancelled by user');
          break;
        }
      case FacebookLoginStatus.error:
        {
          print(_result.errorMessage);
          break;
        }
    }
  }

  logout() {
    _facebookLogin.logOut();
  }

  @override
  void dispose() {
    logout();
    super.dispose();
  }

  @override
  void initState() {
    _facebookLogin = FacebookLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: <Widget>[
            _profile == null
                ? Container()
                : Image.network(_profile['picture']['data']['url']),
            RaisedButton(
              onPressed: login,
              color: Color(0xFF163F64),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    'Sign in with Facebook',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
