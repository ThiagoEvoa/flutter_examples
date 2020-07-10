# CheckboxListTile
<p align="center">
<img src="" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (items) => "CheckboxListTile $items");
  final itemsCheck = List<bool>.generate(20, (items) => false);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: itemsCheck[index],
            onChanged: (value) {
              setState(() {
                itemsCheck[index] = value;
              });
            },
            title: Text(items[index]),
            secondary: Icon(Icons.android),
            controlAffinity: ListTileControlAffinity.platform,
          );
        },
      ),
    );
  }
}
```
