# PackageInfo
<!--<p align="center">
<img src="https://docs.google.com/uc?id=1fDWdaHU9UmvL05_2ZbaTygZSM-KGrYHz" height="649" width="300">
</p>-->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  package_info: ^0.4.0+10
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Future<PackageInfo> _getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FutureBuilder<PackageInfo>(
          future: _getPackageInfo(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'AppName: ${snapshot.data.appName}',
                  ),
                  Text(
                    'App BuildNumber: ${snapshot.data.buildNumber}',
                  ),
                  Text(
                    'App PackageNumber: ${snapshot.data.packageName}',
                  ),
                  Text(
                    'App Version: ${snapshot.data.version}',
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
```
