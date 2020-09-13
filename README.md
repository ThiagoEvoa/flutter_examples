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

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```
