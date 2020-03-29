# Firebase Messaging
<!-- <p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/firebasemessaging.gif" height="649" width="300">
</p> -->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  firebase_messaging: ^6.0.13
  http: ^0.12.0+4
  firebase_core: ^0.4.4+3
  firebase_analytics: ^5.0.11
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    FirebaseMessagingService().configure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(),
    );
  }
}
```

### FirebaseMessagingService
```dart
class FirebaseMessagingService {
  FirebaseMessaging _firebaseMessaging;
  StreamSubscription _iosSubscription;

  FirebaseMessagingService() : _firebaseMessaging = FirebaseMessaging() {
    if (Platform.isIOS) {
      _iosSubscription =
          _firebaseMessaging.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
      });
      _firebaseMessaging
          .requestNotificationPermissions(IosNotificationSettings());
    }
  }

  configure() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch: $message');
    }, onResume: (Map<String, dynamic> message) async {
      print('onResume: $message');
    });
  }
}
```
