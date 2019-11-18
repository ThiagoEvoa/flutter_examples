import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends InheritedWidget {
  final Widget child;

  HomeController({this.child}) : super(child: child);

  final BehaviorSubject<int> _streamController = BehaviorSubject.seeded(0);
  Sink<int> get input => _streamController.sink;
  Stream<int> get output => _streamController.stream;

  static HomeController of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(HomeController)
        as HomeController;
  }

  dispose() {
    _streamController.close();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}
