import 'package:example/page1.dart';
import 'package:example/page2.dart';
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
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Tab1",
              ),
              Tab(
                text: "Tab2",
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Page1(),
              Page2(),
            ],
          ),
        ),
      ),
    );
  }
}
