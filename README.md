# Column
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/column.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Column example',
            ),
            Text(
              'Aligning widgets on top of another',
            ),
          ],
        ),
      ),
    );
  }
}
```
