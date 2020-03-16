# Device Info
<!-- <p align="center">
<img src="https://docs.google.com/uc?id=1T3bnJwFf6QfN_FNwiJb3-tFtYZpemrgD" height="649" width="300">
</p> -->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  device_info: ^0.4.2+1
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  IosDeviceInfo _iosDeviceInfo;
  AndroidDeviceInfo _androidDeviceInfo;

  _getDeviceInfo() async {
    if (Platform.isIOS) {
      _iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
    } else {
      _androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
    }
    setState(() {});
  }

  @override
  void initState() {
    _getDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_iosDeviceInfo != null
                ? 'iOS info: ${_iosDeviceInfo.name}'
                : 'Android info: ${_androidDeviceInfo.model}'),
          ],
        ),
      ),
    );
  }
}
```
