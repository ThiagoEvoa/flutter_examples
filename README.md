# Hooks
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/hooks.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_hooks: ^0.12.0
```

### Main
```dart
class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final hideFabAnimationController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimationController);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FadeTransition(
        opacity: hideFabAnimationController,
        child: ScaleTransition(
          scale: hideFabAnimationController,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            Card(child: FittedBox(child: FlutterLogo())),
        ],
      ),
    );
  }
}
```

### ScrollController
```dart
ScrollController useScrollControllerForAnimation(
    AnimationController animationController) {
  return use(
    _ScrollControllerForAnimationHook(animationController: animationController),
  );
}

class _ScrollControllerForAnimationHook extends Hook<ScrollController> {
  final AnimationController animationController;

  const _ScrollControllerForAnimationHook({
    @required this.animationController,
  });

  @override
  _ScrollControllerForAnimationHookState createState() =>
      _ScrollControllerForAnimationHookState();
}

class _ScrollControllerForAnimationHookState
    extends HookState<ScrollController, _ScrollControllerForAnimationHook> {
  ScrollController _scrollController;

  @override
  void initHook() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        switch (_scrollController.position.userScrollDirection) {
          case ScrollDirection.forward:
            hook.animationController.forward();
            break;
          case ScrollDirection.reverse:
            hook.animationController.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      },
    );
  }

  @override
  ScrollController build(BuildContext context) => _scrollController;

  @override
  void dispose() => _scrollController.dispose();
}
```
