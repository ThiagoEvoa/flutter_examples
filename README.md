# Tooltip
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/tooltip.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'I long clicked on screen to show a Tooltip',
      child: Material(),
    );
  }
}
```
