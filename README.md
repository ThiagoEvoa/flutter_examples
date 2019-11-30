# Wrap
<p align="center">
<img src="https://docs.google.com/uc?id=1Vr8Rm3HdrG5oWwqnbjWSf2oJqsVFNqgR" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 20,
          children: <Widget>[
            Text(
              'Wrap example',
            ),
            Text(
              'A alternative between Column and Row',
            ),
          ],
        ),
      ),
    );
  }
}
```
