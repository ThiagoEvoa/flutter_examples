# Biometric
<!--<p align="center">
<img src="https://docs.google.com/uc?id=1fDWdaHU9UmvL05_2ZbaTygZSM-KGrYHz" height="649" width="300">
</p>-->

### Dependencies
```dart
dependencies:
  flutter:
    sdk: flutter
  local_auth: ^0.6.0+1
```

### Configuration

#### iOS Info.plist
```dart
<key>NSFaceIDUsageDescription</key>
<string>The app need your permission to use biometric</string>
```

#### Android Manifest.xml
```dart
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
```

```dart
class _MyHomePageState extends State<MyHomePage> {
  final auth = LocalAuthentication();

  Future<bool> _canCheckBiometric() async {
    return await auth.canCheckBiometrics;
  }

  Future<List<BiometricType>> _getAvailableBiometrics() async {
    final list = await auth.getAvailableBiometrics();
    return list;
  }

  _authenticate() async {
    try {
      return await auth.authenticateWithBiometrics(
        localizedReason: 'authenticate to access',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: _canCheckBiometric(),
                builder: (context, snapshot) {
                  return Text(
                      'Can check Biometric: ${snapshot.data.toString()}');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FutureBuilder(
                  future: _getAvailableBiometrics(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Text(snapshot.data[index].toString());
                        },
                      );
                    } else {
                      return Text('Nothing here');
                    }
                  },
                ),
              ),
            ),
            RaisedButton(
              onPressed: _authenticate,
              child: Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}
``
