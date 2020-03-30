# Firebase RemoteConfig
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/firebaseremoteconfig.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.4+3
  firebase_analytics: ^5.0.11
  firebase_remote_config: ^0.3.0+3
```

### Main
```dart
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
```
