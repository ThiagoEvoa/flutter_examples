import 'dart:async';

import 'package:connectivity/connectivity.dart';
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
  Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult;
  ConnectivityResult _connectivitySubscriptionResult;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  _checkConnectivity() async {
    _connectivityResult = await _connectivity.checkConnectivity();
    setState(() {});
  }

  _checkConnectivitySubscription() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      setState(() {
        _connectivitySubscriptionResult = result;
      });
    });
  }

  @override
  void initState() {
    _checkConnectivity();
    _checkConnectivitySubscription();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

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
            Text(
              'Connectivity Subscription: ${_connectivitySubscriptionResult.toString()}',
            ),
            Text(
              'Check Connectivity: ${_connectivityResult.toString()}',
            ),
            RaisedButton(
              onPressed: _checkConnectivity,
              child: Text('Check Connectivity'),
            ),
          ],
        ),
      ),
    );
  }
}
