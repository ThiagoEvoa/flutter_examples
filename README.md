# Geolocator
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/geolocator.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  geolocator: ^5.1.5
```

### Configuration

#### iOS Info.plist
> Add those lines into the Info.plist, to be able to ask for user permission

```dart
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location when in the background.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>This app needs access to location when open and in the background.</string>
```

#### Android Manifest.xml
> Add those lines into the Manifest.xml, to be able to ask for user permission

```dart
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress = "";

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((error) {
      print(error);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placesMark = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark placeMark = placesMark[0];
      setState(() {
        _currentAddress =
            "${placeMark.locality}, ${placeMark.postalCode}, ${placeMark.country}";
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                _currentAddress,
                style: TextStyle(fontSize: 20),
              ),
            ),
            RaisedButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text("Get Location"),
            ),
          ],
        ),
      ),
    );
  }
}
```
