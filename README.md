# FadeTransition
<p align="center">
<img src="https://docs.google.com/uc?id=1SIK8JsB2_b1nELhhh6UkRqXT4KNoUDH5" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _animation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
```
