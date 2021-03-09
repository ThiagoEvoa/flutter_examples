# ScrollablePositionedList
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/scrollable_positioned_list.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  scrollable_positioned_list: ^0.1.10
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final list = List.generate(100, (index) => 'Item $index');
  ItemScrollController itemScrollController = ItemScrollController();

  scroll({@required int position}) {
    itemScrollController.scrollTo(
      index: position,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => scroll(position: 0),
                  child: Text('Go to top'),
                ),
                ElevatedButton(
                  onPressed: () => scroll(position: list.length ~/ 2),
                  child: Text('Go to middle'),
                ),
                ElevatedButton(
                  onPressed: () => scroll(position: list.length),
                  child: Text('Go to bottom'),
                ),
              ],
            ),
            Flexible(
              child: ScrollablePositionedList.builder(
                itemCount: list.length,
                itemScrollController: itemScrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      list[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
