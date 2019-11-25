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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: FlutterLogo(),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        mini: false,
        tooltip: 'This is the FloatingActionButton',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
