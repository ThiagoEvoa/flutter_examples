# RefreshIndicator
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/refreshindicator.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (index) => "ListView Builder $index");

  Future<void> _myFunction() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: RefreshIndicator(
        onRefresh: _myFunction,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
```
