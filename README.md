# Bloc + rxDart
<p align="center">
<img src="https://docs.google.com/uc?id=1T3bnJwFf6QfN_FNwiJb3-tFtYZpemrgD" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  rxdart: ^0.22.6
```

### Main
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeController(child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void dispose() {
    HomeController.of(context).dispose();
    super.dispose();
  }

  void _incrementCounter(BuildContext context) {
    HomeController.of(context).input.add(++_counter);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: HomeController.of(context).output,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _incrementCounter(context);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
```

### CounterBloc
```dart
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
```
