# ReorderableListView
<p align="center">
<img src="https://docs.google.com/uc?id=1mEGZIpq4f90OO4Xvvz3JSUsdM0uf5bXw" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  final items =
      List<String>.generate(20, (items) => "Reorderable Listview $items");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(
            () {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              var item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            },
          );
        },
        header: Text(
          'Header',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        children: <Widget>[
          for (final item in items)
            ListTile(
              key: ValueKey(item),
              title: Text(item),
            ),
        ],
      ),
    );
  }
}
```
