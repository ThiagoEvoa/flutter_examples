import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
