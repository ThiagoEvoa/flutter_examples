# Websocket
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/websocket.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  web_socket_channel: ^1.2.0
```

#### Main.dart
```dart
class _MyHomePageState extends State<MyHomePage> {
  IOWebSocketChannel _channel;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                  );
                },
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Send a message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _channel.sink.add(_controller.text);
                        _controller.clear();
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
