# ListView Builder
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/listviewbuilder.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (items) => "ListView Builder $items");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
```
