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
  firebase_messaging: ^7.0.0
  firebase_core: ^0.5.0
  firebase_analytics: ^6.0.0
```

### Configuration

#### iOS AppDelegate.swift
> Add those lines into the Info.plist, to be able to receive notification

```dart
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

#### Android MainActivity.kt
> Add those lines into the MainActivity.kt, to be able to receive notification

```dart
class MainActivity: FlutterActivity(), PluginRegistry.PluginRegistrantCallback{
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
  }

  override fun registerWith(registry: PluginRegistry){
    GeneratedPluginRegistrant.registerWith(registry)
  }
}
```

#### Android AndroidManifest.xml
> Add those lines into the AndroidManifest.xml, to be able to receive notification

```dart
<intent-filter>
    <action android:name="FLUTTER_NOTIFICATION_CLICK" />
    <category android:name="android.intent.category.DEFAULT" />
</intent-filter>
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
