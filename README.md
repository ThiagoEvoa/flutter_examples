# Flutter Launcher Icons
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flutter_launcher_icons.png" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
flutter_icons:
image_path: 'assets/images/icon.png'
android: true
ios: true

dependencies:
  flutter:
    sdk: flutter
  image_picker: ^0.6.7+4
```
> Note: If you want to have different icons according to the platform use image_path according it

```dart
image_path_ios: 'assets/images/icon_ios.png'
image_path_android: 'assets/images/icon_android.png'
```

> Inside your project run this command
```dart
flutter pub run flutter_launcher_icons:main
```
