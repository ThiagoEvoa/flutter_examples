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
  final items =
      List<String>.generate(20, (items) => "Reorderable Listview $items");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(
            () {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              var item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            },
          );
        },
        header: Text(
          'Header',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        children: <Widget>[
          for (final item in items)
            ListTile(
              key: ValueKey(item),
              title: Text(item),
            ),
        ],
      ),
    );
  }
}
