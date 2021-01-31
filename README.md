# ShaderMask
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/shader_mask.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Future<void> timer() {
    return Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: timer(),
        builder: (context, snapshot) {
          return Center(
            child: ShaderMask(
              blendMode: snapshot.connectionState == ConnectionState.waiting
                  ? BlendMode.lighten
                  : BlendMode.modulate,
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey,
                    Colors.grey,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                'This is the ShaderMask',
              ),
            ),
          );
        },
      ),
    );
  }
}
```
