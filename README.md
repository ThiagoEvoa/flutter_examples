# Text
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/infinity_scroll.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _counterNotifier = CounterNotifier();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _counterNotifier.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<List<String>>(
        valueListenable: _counterNotifier.items,
        builder: (context, value, snapshot) {
          if (value.length == 0) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: value.length + 1,
              itemBuilder: (context, index) {
                if (index < value.length) {
                  return ListTile(
                    title: Text('${value[index]}'),
                  );
                } else if (_counterNotifier.hasMore.value) {
                  _counterNotifier.fetch();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Center(child: Text('Nothing more to load')),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
```

### ListNotifier
```dart
class CounterNotifier extends ChangeNotifier {
  final items = ValueNotifier<List<String>>([]);
  final hasMore = ValueNotifier<bool>(false);

  fetch() async {
    final result = await _fetch(items.value);

    if (result.length > 0 && result.length < 40) {
      hasMore.value = true;
      items.value = result;
    } else {
      hasMore.value = false;
    }
    items.notifyListeners();
  }

  Future<List<String>> _fetch(List<String> list) async {
    await Future.delayed(Duration(seconds: 3));
    return List<String>.generate(list.length + 20, (index) => 'Item: $index');
  }
}
```
