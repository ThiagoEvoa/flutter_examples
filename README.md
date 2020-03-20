# Switch
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/switch.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Switch(
          value: value,
          activeColor: Colors.blue,
          activeTrackColor: Colors.blue[100],
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
      ),
    );
  }
}
```
