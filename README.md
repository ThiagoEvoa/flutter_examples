# Row
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/row.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Row example ',
            ),
            Text(
              'Aligning widgets beside another',
            ),
          ],
        ),
      ),
    );
  }
}
```
