# SharedPreferences
<p align="center">
<img src="https://docs.google.com/uc?id=1--fpitgfHKHojFJ052qw2fMOuupZiwPa" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^0.5.4+5
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final textFieldController = TextEditingController();

    Future<SharedPreferences> _getSharedPreferences() async {
      return await SharedPreferences.getInstance();
    }

    return FutureBuilder<SharedPreferences>(
      future: _getSharedPreferences(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Material(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textFieldController,
                      decoration: InputDecoration(
                        labelText: 'Type something',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            snapshot.data
                                .setString("text", textFieldController.text);
                          });
                        },
                        child: Text("Save"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            snapshot.data.setString("text", null);
                          });
                        },
                        child: Text("Erase"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      snapshot.data.getString("text") == null
                          ? ''
                          : snapshot.data.getString("text"),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
```
