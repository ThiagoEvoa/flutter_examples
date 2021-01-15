import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linkedloginflutter.dart';

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
  String _profilePicture;
  String _email;
  String _accessToken;

  initializeLinkedIn() {
    LinkedInLogin.initialize(
      context,
      clientId: '',
      clientSecret: '',
      redirectUri: '',
    );
  }

  getAccessToken() {
    LinkedInLogin.loginForAccessToken(
      destroySession: true,
      appBar: AppBar(
        title: Text('Flutter LinkedIn'),
      ),
    ).then((accessToken) {
      _accessToken = accessToken;
    }).catchError((onError) => print(onError));
  }

  getLinkedInProfile() {
    LinkedInLogin.getProfile(
      destroySession: true,
      forceLogin: true,
      appBar: AppBar(
        title: Text('Flutter LinkedIn'),
      ),
    ).then((profile) {
      setState(() {
        setState(() {
          _profilePicture = profile.profilePicture.profilePictureDisplayImage
              .elements.first.identifiers.first.identifier;
        });
      });
    }).catchError((onError) => print(onError));
  }

  getLinkedInProfileEmail() {
    LinkedInLogin.getEmail(
      destroySession: true,
      forceLogin: true,
      appBar: AppBar(
        title: Text('Flutter LinkedIn'),
      ),
    ).then((email) {
      setState(() {
        _email = email.elements.first.elementHandle.emailAddress;
      });
    }).catchError((onError) => print(onError));
  }

  @override
  void initState() {
    initializeLinkedIn();
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
            _profilePicture == null
                ? Container()
                : Image.network(_profilePicture),
            RaisedButton(
              onPressed: getLinkedInProfile,
              color: Color(0xFF163F64),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                  Text(
                    'Sign in with Linkedin',
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
