# Lottie
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/lottie.gif" height="649" width="300">
</p>

### Dependencies
> On the root of the project, you need to create the folder <b>lottie</b>, and add the file <b>.json</b>

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  lottie: ^0.7.0+1

assets:
  - assets/lottie/animation.json
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Lottie.asset(
          'assets/lottie/animation.json',
          controller: _animationController,
          onLoaded: (composition) {
            _animationController = AnimationController(
              vsync: this,
              duration: composition.duration,
            );
            _animationController..forward();
          },
        ),
      ),
    );
  }
}
```
