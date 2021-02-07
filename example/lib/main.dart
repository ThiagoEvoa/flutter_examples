import 'package:flutter/material.dart';
import 'package:flutter_mdns_plugin/flutter_mdns_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  FlutterMdnsPlugin _flutterMdnsPlugin;
  List<String> messageLog = <String>[];

  _discoverServices() {
    DiscoveryCallbacks discoveryCallbacks = DiscoveryCallbacks(
      onDiscovered: (ServiceInfo info) {
        setState(() {
          messageLog.add('DISCOVERY: onDiscovereded ${info.toString()}');
        });
      },
      onDiscoveryStarted: () {
        setState(() {
          messageLog.add('DISCOVERY: onDiscoveryStarted');
        });
      },
      onDiscoveryStopped: () {
        setState(() {
          messageLog.add('DISCOVERY: onDiscoveryStopped');
        });
      },
      onResolved: (ServiceInfo info) {
        setState(() {
          messageLog.add('DISCOVERY: onResolved ${info.toString()}');
        });
      },
    );
    _flutterMdnsPlugin =
        FlutterMdnsPlugin(discoveryCallbacks: discoveryCallbacks);
    _flutterMdnsPlugin.startDiscovery('_http._tcp.');
  }

  @override
  void initState() {
    _discoverServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: messageLog.length,
          itemBuilder: (context, index) {
            return Text(
              messageLog[index],
            );
          },
        ),
      ),
    );
  }
}
