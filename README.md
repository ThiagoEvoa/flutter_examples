# TextField
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/textfield.gif" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            labelText: "TextField Widget",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
