# RaisedButton
<p align="center">
<img src="https://docs.google.com/uc?id=1oJKinkuLVo5f-MZ2QKWStxSUaGA8j8Hs" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text("Raised Button"),
        ),
      ),
    );
  }
}
```
