# Google Auth
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/google_signin.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  google_sign_in: ^4.3.0
```

### Configuration

#### iOS Info.plist
> Add those lines into the Info.plist, to be able to ask for user permission 

```dart
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>{PEOPLE_API_REVERSE_ID}</string>
		</array>
	</dict>
</array>
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  GoogleSignService _googleSignService = GoogleSignService();
  GoogleSignInAccount _googleSignInAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
```
### GoogleSignService
```dart
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignService {
  GoogleSignIn _googleSignIn;

  GoogleSignService()
      : _googleSignIn = GoogleSignIn(scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ]);

  Future<GoogleSignInAccount> handleSignIn() async {
    return await _googleSignIn.signIn();
  }

  Future<GoogleSignInAccount> logOut() async{
    return await _googleSignIn.signOut();
  }
}
```

