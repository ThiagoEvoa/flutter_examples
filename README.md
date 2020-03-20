# AnimatedBuilder
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/animatedbuilder.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _animation = Tween(begin: 0.0, end: 2.0 * pi).animate(_controller);

    return Material(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, widget) {
          return Transform.rotate(
            angle: _animation.value,
            child: widget,
          );
        },
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Material(child: FlutterLogo());
          },
        ),
      ),
    );
  }
}
```
