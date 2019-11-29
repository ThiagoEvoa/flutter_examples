# Bloc
<p align="center">
<img src="https://docs.google.com/uc?id=1T3bnJwFf6QfN_FNwiJb3-tFtYZpemrgD" height="649" width="300">
</p>

### Dependencies
```dart
dependencies:
  flutter:
    sdk: flutter
  bloc: ^2.0.0
```

```dart
class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocSupervisor.delegate = SimpleBlocDelegate();

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
            StreamBuilder(
              stream: counterBloc,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterEvent.INCREMENT);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### CounterEventEnum
```dart
enum CounterEvent { INCREMENT }
```

### CounterBloc
```dart
class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(event) async* {
    switch (event) {
      case CounterEvent.INCREMENT:
        yield state + 1;
        break;
      default:
        throw Exception('unhandled event: $event');
    }
  }
}
```

### CounterDelegate
```dart
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}
```
