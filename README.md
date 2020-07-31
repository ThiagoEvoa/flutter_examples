# Mobx
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/state.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _counter = CounterMobx();

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
            Observer(
              builder: (context) {
                return Text(
                  '${_counter.value}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### MobxCounter
```dart
class CounterMobx {
  CounterMobx() {
    increment = Action(_increment);
  }

  final _value = Observable(0);
  Action increment;

  int get value => _value.value;
  set value(int newValue) => _value.value = newValue;

  _increment() {
    _value.value++;
  }
}
```
