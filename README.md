# Dismissible
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/dismissible.gif" height="649" width="300">
</p>

### Main
```dart
lass _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (index) => "Dismissible $index");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index].toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            background: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
```
