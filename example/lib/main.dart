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
