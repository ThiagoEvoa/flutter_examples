# Column
<p align="center">
<img src="https://docs.google.com/uc?id=1Fdr-K7L-9LDUa3sGyBVf9Ms-cnkijtiJ" height="649" width="300">
</p>

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
