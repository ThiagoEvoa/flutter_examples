# Slider
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/slider.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Slider(
          value: value,
          activeColor: Colors.blue,
          inactiveColor: Colors.blue[100],
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
