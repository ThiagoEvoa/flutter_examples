# RaisedButton
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/raisedbutton.gif" height="649" width="300">
</p>

### Main
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
