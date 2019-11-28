# Image Network
<p align="center">
<img src="https://docs.google.com/uc?id=1R14xl-IftWOApbs_9Zbu2oL3DXsrC5ZE" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          child: FlutterLogo(),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
```
