# Firebase InAppMessage
<!--<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/state.gif" height="649" width="300">
</p>-->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.4+3
  firebase_in_app_messaging: ^0.1.1+3
  firebase_analytics: ^5.0.11
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  FirebaseInAppMessaging _firebaseInAppMessaging = FirebaseInAppMessaging.instance;
  
  @override
  void initState() {
    _firebaseInAppMessaging.triggerEvent('myEvent');
    _firebaseInAppMessaging.setAutomaticDataCollectionEnabled(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        
      ),
    );
  }
}
```
