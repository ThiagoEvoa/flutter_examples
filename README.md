# CircularProgressIndicator
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/circularprogressindicator.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Animation<Color> _animationColor =
      AlwaysStoppedAnimation<Color>(Colors.blue[50]);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue[900],
          strokeWidth: 3,
          valueColor: _animationColor,
        ),
      ),
    );
  }
}
```
