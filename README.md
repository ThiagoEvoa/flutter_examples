# SplashScreen
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/splashscreen.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _fadeController;
  AnimationController _rotateController;
  Animation<double> _fadeAnimation;
  Animation<double> _rotateAnimation;

  @override
  void initState() {
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _rotateAnimation =
        Tween(begin: 0.0, end: 1 * pi).animate(_rotateController);

    _fadeController.forward().then((_) {
      _rotateController.forward();
    });

    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Second()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Hero(
          tag: 'logo',
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: AnimatedBuilder(
                    animation: _rotateAnimation,
                    builder: (context, widget) {
                      return Transform.rotate(
                          angle: _rotateAnimation.value, child: widget);
                    },
                    child: FlutterLogo(
                      size: 300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Second
```dart
class _SecondState extends State<Second> with SingleTickerProviderStateMixin {
  AnimationController _rotateController;
  Animation<double> _rotateAnimation;

  @override
  void initState() {
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _rotateAnimation =
        Tween(begin: 1 * pi, end: 2 * pi).animate(_rotateController);

    _rotateController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Hero(
                tag: 'logo',
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: AnimatedBuilder(
                        animation: _rotateAnimation,
                        builder: (context, widget) {
                          return Transform.rotate(
                              angle: _rotateAnimation.value, child: widget);
                        },
                        child: FlutterLogo(
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```
