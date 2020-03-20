# SafeArea
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/safearea.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
```
