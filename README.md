# LinearProgressIndicator
<p align="center">
<img src="https://docs.google.com/uc?id=1mExNt_3aSenvVJqpLIa_pfUYI7hRK7jC" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  Animation<Color> _animationColor =
      AlwaysStoppedAnimation<Color>(Colors.blue[50]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LinearProgressIndicator(
        backgroundColor: Colors.blue[900],
        valueColor: _animationColor,
      ),
    );
  }
}
```
