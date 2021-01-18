# Flutter Facebook
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/facebook_login.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_facebook_login: ^3.0.0
  http: ^0.12.2
```

### Configure Facebook App
> Enter in the link https://developers.facebook.com/apps, and create the appfor each platform.


### Configuration

#### iOS Info.plist
```dart
<key>CFBundleURLTypes</key> 
<array> 
    <dict> 
        <key>CFBundleURLSchemes</key> 
        <array> 
            <string>fb{App ID}</string> 
        </array> 
    </dict> 
</array> 
<key>FacebookAppID</key> 
<string>{App ID}</string> 
<key>FacebookDisplayName</key> 
<string>{App Name}</string>
```

#### Android Manifest.xml
```dart
<meta-data android:name="com.facebook.sdk.ApplicationId"
    android:value="@string/facebook_app_id"/>

<activity android:name="com.facebook.FacebookActivity"
    android:configChanges=
            "keyboard|keyboardHidden|screenLayout|screenSize|orientation"
    android:label="@string/app_name" />

<activity
    android:name="com.facebook.CustomTabActivity"
    android:exported="true">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="@string/fb_login_protocol_scheme" />
    </intent-filter>
</activity>
```

#### Android strings.xml
```dart
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">{App Name}</string>
    <string name="facebook_app_id">{App ID}</string>
    <string name="fb_login_protocol_scheme">fb{App ID}</string>
</resources>
```

```dart
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
```
