# FlutterSecureStorage
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/sharedpreferences.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
    flutter_secure_storage: ^3.3.5
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final textFieldController = TextEditingController();
    final secureStorage = FlutterSecureStorage();

    return FutureBuilder<Map<String, String>>(
      future: secureStorage.readAll(),
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
                            secureStorage.write(key: "text", value: textFieldController.text);
                          });
                        },
                        child: Text("Save"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            secureStorage.delete(key: "text");
                          });
                        },
                        child: Text("Erase"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      snapshot.data.entries.length == 0
                          ? ''
                          : snapshot.data.entries.elementAt(0).value,
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
