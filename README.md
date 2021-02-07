# PackageInfo

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_mdns_plugin: ^0.0.2
```

### Main
```dart
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
```
