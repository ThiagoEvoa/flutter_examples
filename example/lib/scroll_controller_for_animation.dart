import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
