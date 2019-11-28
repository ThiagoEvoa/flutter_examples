# TextField
<p align="center">
<img src="https://docs.google.com/uc?id=18JAxaXXV8-7_G0NcjlmHqtwIkFuBP8dw" height="649" width="300">
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
