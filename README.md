# Firebase Auth
<p align="center">
<img src="https://docs.google.com/uc?id=1EPtbun0HCkU7ItHw2kSdnjuqKWsP1-DG" height="649" width="300">
</p>

### Dependencies
```dart
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.2
  firebase_analytics: ^5.0.6
  firebase_auth: ^0.15.0+1
```

```dart
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
```

### FirebaseAuthService
```dart
class FirebaseAuthService {
  FirebaseAuth _firebaseAuth;

  FirebaseAuthService() : _firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> sign(
      {@required String email, @required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<AuthResult> signUp(
      {@required String email, @required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSigned() async {
    return await _firebaseAuth.currentUser() != null;
  }

  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<void> resetPassword({@required String email}) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
```
