# Checkbox
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/checkbox.gif" height="649" width="300">
</p>

### Main
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
