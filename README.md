# CircularProgressIndicator
<p align="center">
<img src="https://docs.google.com/uc?id=1ifK2aRER3qRR5yu68eRbpxUqiI8_Yy9L" height="649" width="300">
</p>

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
