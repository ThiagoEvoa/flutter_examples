import 'package:firebase_remote_config/firebase_remote_config.dart';
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
  RemoteConfig _remoteConfig;
  Map<String, dynamic> _defaults;

  Future<RemoteConfig> _getConfigs() async {
    _remoteConfig = await RemoteConfig.instance;
    await _remoteConfig.fetch(expiration: const Duration(hours: 5));
    await _remoteConfig.activateFetched();
    return _remoteConfig;
  }

  _setDefaults() async {
    _defaults = <String, dynamic>{'test': 'My Config'};
    await _remoteConfig.setDefaults(_defaults);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<RemoteConfig>(
        future: _getConfigs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Center(
                child: Text(snapshot.data.getString('my_config')),
              ),
            );
            ;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
