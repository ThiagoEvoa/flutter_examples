# ImageFiltered
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/image_filtered.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Material(
        child: Center(
          child: ImageFiltered(
            imageFilter: ImageFilter.matrix(
              Matrix4.rotationZ(0.2).storage,
            ),
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
```
