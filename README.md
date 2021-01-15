# Flutter Linkedin
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flutter_linkedin.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_linkedin: ^1.0.2
```

### Configure LinkedIn App
> Enter in the link https://www.linkedin.com/developers/, and create the app. After do it go to the Products section and anable the Sign in with LinkedIn. On the Auth section copy the Client ID and the Client Secret, and past on your project.

```dart
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
```
