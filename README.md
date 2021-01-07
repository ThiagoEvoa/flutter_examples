# Navigation 2
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/navigation.gif" height="649" width="300">
</p>

### Main
```dart
class _MyAppState extends State<MyApp> {
  String _data;
  bool _shouldReplace;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
        onPopPage: (Route<dynamic> route, dynamic result) {
          if (!route.didPop(result)) return false;
          setState(() {
            _data = null;
          });
          return true;
        },
        pages: [
          MaterialPage(
            key: ValueKey('FirstPage'),
            maintainState: false,
            child: FirstPage(
              onPressed: (value, shoulReplace) {
                setState(() {
                  _data = value;
                  _shouldReplace = shoulReplace;
                });
              },
            ),
          ),
          if (_data != null)
            MaterialPage(
              key: ValueKey('SecondPage'),
              child: SecondPage(
                data: _data,
                shouldReplace: _shouldReplace,
              ),
            ),
        ],
      ),
    );
  }
}
```

### SecondPage
```dart
class FirstPage extends StatefulWidget {
  final void Function(dynamic value, bool shouldReplace) onPressed;

  const FirstPage({Key key, this.onPressed}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controller,
                decoration:
                    InputDecoration(hintText: "Navigate data beteween pages"),
                onSubmitted: (text) => widget.onPressed(text, false),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () => widget.onPressed(_controller.text, false),
                child: Text("Push"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () => widget.onPressed(_controller.text, true),
                child: Text("Push Replacement"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### SecondPage
```dart
class SecondPage extends StatefulWidget {
  final String data;
  final bool shouldReplace;

  const SecondPage({this.data, this.shouldReplace});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Icon icon =
      Platform.isIOS ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.shouldReplace ? false : true,
      child: Scaffold(
        appBar: AppBar(
          leading: widget.shouldReplace
              ? Container()
              : IconButton(icon: icon, onPressed: () => Navigator.pop(context)),
        ),
        body: Center(
          child: Text(widget.data),
        ),
      ),
    );
  }
}
```

