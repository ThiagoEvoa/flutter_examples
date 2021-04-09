# Flutter Slidable
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flutter_slidable.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_slidable: ^0.5.7
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (index) => "ListView Builder $index");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              title: Text(
                items[index],
              ),
            ),
            secondaryActions: [
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    items.removeAt(index);
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
```

### IconButtonWidget
```dart
class IconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Slidable.of(context).open(actionType: SlideActionType.secondary);
      },
      icon: Icon(Icons.more_vert_rounded),
    );
  }
}
```
