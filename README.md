# Riverpod
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/state.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^0.12.1
```

### Main
```dart
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  _incrementCounter() {
    context.read(counterProvider).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
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
            Consumer(
              builder: (context, watch, child) {
                final counter = watch(counterProvider.state);
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### CounterProvider
```dart
class CounterProvider extends StateNotifier<int> {
  CounterProvider() : super(0);

  incrementCounter() {
    state++;
  }
}
```

### Riverpods
```dart
final counterProvider = StateNotifierProvider((ref) => CounterProvider());
```
