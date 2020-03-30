import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
