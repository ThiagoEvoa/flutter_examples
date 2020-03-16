# Share
<!-- <p align="center">
<img src="https://docs.google.com/uc?id=1T3bnJwFf6QfN_FNwiJb3-tFtYZpemrgD" height="649" width="300">
</p> -->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  share: ^0.6.3+6
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: IconButton(
          onPressed: () {
            Share.share('https://thiagoevoa.github.io');
          },
          icon: Icon(Icons.share),
        ),
      ),
    );
  }
}
```
