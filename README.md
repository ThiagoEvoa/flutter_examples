# ClipPath
<p align="center">
<img src="https://docs.google.com/uc?id=10kPH1BFtAPpIXZWCZOuJHUpytoGioMIU" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ClipPath(
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.black,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
```
