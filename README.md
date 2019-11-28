# AnimatedIcon
<p align="center">
<img src="https://docs.google.com/uc?id=1-KyHzpPxCyVnygcwf9Pz8asaZGevJyb4" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: IconButton(
          onPressed: _handleOnPressed,
          color: Colors.blue,
          iconSize: 100,
          tooltip: 'IconButton',
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
          ),
        ),
      ),
    );
  }
}
```
