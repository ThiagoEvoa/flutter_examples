# DarkTheme
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/darktheme.png" height="649" width="300">
</p>

### Main
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}
```
