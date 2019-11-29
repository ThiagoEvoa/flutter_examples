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
```swift
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
<p>Under "<application" put this meta-data</p>

```dart
<meta-data android:name="com.google.android.geo.API_KEY" android:value="YOUR KEY HERE"/>
```

