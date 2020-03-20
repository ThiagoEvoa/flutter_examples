# FlatButton
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flatbutton.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FlatButton(
          onPressed: () {},
          textColor: Colors.blue,
          child: Text("Flat Button"),
        ),
      ),
    );
  }
}
```
