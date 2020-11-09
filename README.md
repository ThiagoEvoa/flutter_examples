# InteractiveViewer
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/interactiveviewer.png" height="649" width="300">
</p>
<!-- https://docs.google.com/uc?id=1fDWdaHU9UmvL05_2ZbaTygZSM-KGrYHz -->

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: InteractiveViewer(
          constrained: true,
          scaleEnabled: true,
          child: Center(
            child: Image.network(
              'https://i2.wp.com/aspgems.com/wp-content/uploads/2020/01/flutter-dart.png?fit=1200%2C600&ssl=1'
            ),
          ),
        ),
      ),
    );
  }
}
```
