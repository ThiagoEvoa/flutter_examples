# Row
<p align="center">
<img src="https://docs.google.com/uc?id=12hgX8qmZw6fHUxklxNDs_4xwvYgv4-qQ" height="649" width="300">
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
