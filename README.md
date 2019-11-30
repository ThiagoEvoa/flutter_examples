# GeneralDialog
<p align="center">
<img src="https://docs.google.com/uc?id=1DAmoqFukWkUfESHzycnJvZATqPYaD9aF" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Future<void> _generalDialog() async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(seconds: 3),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        var fadeTween = CurveTween(curve: Curves.fastOutSlowIn);
        var fadeAnimation = fadeTween.animate(animation);
        return FadeTransition(
          opacity: fadeAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          title: Text("GeneralDialog"),
          content: Text("GeneralDialog example"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ok"),
            ),
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
          onPressed: _generalDialog,
          child: Text('Show'),
        ),
      ),
    );
  }
}
```
