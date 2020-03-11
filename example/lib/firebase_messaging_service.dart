import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

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
