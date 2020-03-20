# ClipOval
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/clipoval.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.black,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
```
