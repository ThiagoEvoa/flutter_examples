import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences prefs;

  @override
  void initState() {
    _getSharedPreferences();
    super.initState();
  }

  _getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldController = TextEditingController(
        text: prefs.getString("text") == null ? '' : prefs.getString("text"));

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
                      prefs.setString("text", textFieldController.text);
                    });
                  },
                  child: Text("Save"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      prefs.setString("text", null);
                    });
                  },
                  child: Text("Erase"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
