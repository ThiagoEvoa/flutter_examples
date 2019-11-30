# AlertDialog
<p align="center">
<img src="https://docs.google.com/uc?id=1igKsAJhaGZvP_IWyAHusbx3rI0VBqefZ" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Future<void> _dialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('AlertDialog example'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ok"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RaisedButton(
          onPressed: _dialog,
          child: Text('Show'),
        ),
      ),
    );
  }
}
```
