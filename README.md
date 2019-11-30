# Navigation
<p align="center">
<img src="https://docs.google.com/uc?id=1OHPCFXppDWzWgVEl4t2BK735OJs9T_0G" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  _push(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  _pushReplacement(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

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
                onSubmitted: (text) {
                  _push(
                    context,
                    SecondPage(
                      data: text,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {
                  _push(
                    context,
                    SecondPage(
                      data: _controller.text,
                    ),
                  );
                },
                child: Text("Push"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {
                  _pushReplacement(
                    context,
                    SecondPage(
                      data: _controller.text,
                    ),
                  );
                },
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

  const SecondPage({this.data = ''});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.data),
      ),
    );
  }
}
```

