# DarkTheme
<p align="center">
<img src="https://docs.google.com/uc?id=1kgd8KTlpYDUIIGCs5peBlMy9KMEnWJpX" height="649" width="300">
</p>

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
