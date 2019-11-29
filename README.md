# Google Maps
<p align="center">
<img src="https://docs.google.com/uc?id=1UUyIN7TFH5M8nLF1TKzNSUuQUbed8BoI" height="649" width="300">
</p>

### Dependencies
```dart
dependencies:
  flutter:
    sdk: flutter
  google_maps_flutter: ^0.5.21+12
```

### Configuration

#### iOS Info.plist
```dart
<key>io.flutter.embedded_views_preview</key>
<true/>
```
#### iOS AppDelegate.swift
```dart
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

#### Android Manifest.xml
<p>Inside <b>application</b> put this meta-data</p>

```dart
<meta-data android:name="com.google.android.geo.API_KEY" android:value="YOUR KEY HERE"/>
```

```dart
class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
}
```
