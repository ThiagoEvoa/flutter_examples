# BarCode / QRCode
<!--<p align="center">
<img src="https://docs.google.com/uc?id=1fDWdaHU9UmvL05_2ZbaTygZSM-KGrYHz" height="649" width="300">
</p>-->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  barcode_scan: ^1.0.0
  path_provider: ^1.4.4
```

### Configuration

#### iOS Info.plist
```dart
<key>NSCameraUsageDescription</key>
<string>Camera permission is required for barcode scanning.</string>
```

#### Android Manifest.xml
```dart
<uses-permission android:name="android.permission.CAMERA" />
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  String _barCode = "";

  @override
  Widget build(BuildContext context) {
    Future _scan() async {
      try {
        String barCode = await BarcodeScanner.scan();
        setState(() {
          this._barCode = barCode;
        });
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          setState(() {
            this._barCode = 'The user did not grant the camera permission!';
          });
        } else {
          setState(() => this._barCode = 'Unknown error: $e');
        }
      } on FormatException {
        setState(() => this._barCode =
            'null (User returned using the "back"-button before scanning anything. Result)');
      } catch (e) {
        setState(() => this._barCode = 'Unknown error: $e');
      }
    }

    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: _scan,
              icon: Icon(Icons.camera),
            ),
            Text(
              this._barCode,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
```
