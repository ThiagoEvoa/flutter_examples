import 'package:example/second_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
