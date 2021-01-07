import 'package:flutter/material.dart';

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
