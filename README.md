# Switch
<p align="center">
<img src="https://docs.google.com/uc?id=1rztlXTjh3Es3JQBOMEGil8Bth7fCPllv" height="649" width="300">
</p>

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
