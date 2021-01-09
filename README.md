# ValueNotifier
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/state.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  CounterValueNotifier _counterValueNotifier = CounterValueNotifier();

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
            ValueListenableBuilder(
              valueListenable: _counterValueNotifier.counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterValueNotifier.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### CounterValueNotifier
```dart
class CounterValueNotifier {
  final counter = ValueNotifier<int>(0);

  increment() {
    counter.value++;
  }
}
```
