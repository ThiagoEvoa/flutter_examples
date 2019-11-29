# Checkbox
<p align="center">
<img src="https://docs.google.com/uc?id=1ED7ww77o8EFt5DA3c7xvClcNH6e113Qa" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value;
            });
          },
          activeColor: Colors.blue,
          checkColor: Colors.white,
        ),
      ),
    );
  }
}
```
