# ColorFiltered
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/colorfiltered.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.grey,
            BlendMode.modulate,
          ),
          child: FlutterLogo(
            size: 300,
          ),
        ),
      ),
    );
  }
}
```
