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
      home: MyHomePage(title: 'SliverAppBar'),
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
    final items = List<String>.generate(20, (items) => "Item $items");

    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: !innerBoxIsScrolled ? Container() : Text(widget.title),
              actions: <Widget>[
                !innerBoxIsScrolled
                    ? Container()
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      )
              ],
              backgroundColor: Colors.lightBlue[900],
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: !innerBoxIsScrolled ? Container() : Text(widget.title),
                background: FlutterLogo(),
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}