# Text
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/text.png" height="649" width="300">
</p>
<!-- https://docs.google.com/uc?id=1fDWdaHU9UmvL05_2ZbaTygZSM-KGrYHz -->

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Text Widget",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```
