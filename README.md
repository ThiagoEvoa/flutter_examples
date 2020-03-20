# ClipRRect
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/cliprrect.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
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
