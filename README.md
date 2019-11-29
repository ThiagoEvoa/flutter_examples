# ListView Builder
<p align="center">
<img src="https://docs.google.com/uc?id=1K83A2bNHDdCBPOfq73pe-o2p1gSgKlU5" height="649" width="300">
</p>

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
