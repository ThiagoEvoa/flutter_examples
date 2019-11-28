# Snackbar
<p align="center">
<img src="https://docs.google.com/uc?id=10ZecbWlgQ7jn3f6ohX3J0mcYWE9bFlpi" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  final _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(),
      body: Center(
        child: Builder(
          builder: (context) => RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    onPressed: () {},
                    label: 'ok',
                    textColor: Colors.white,
                  ),
                  content: Text("Snackbar"),
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              );
            },
            child: Text("Button"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _globalKey.currentState.showSnackBar(
            SnackBar(
              action: SnackBarAction(
                onPressed: () {},
                label: 'ok',
                textColor: Colors.white,
              ),
              content: Text("Snackbar with global key"),
              backgroundColor: Colors.blue,
              duration: Duration(seconds: 3),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```
