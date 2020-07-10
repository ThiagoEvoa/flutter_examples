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
  final items = List<String>.generate(20, (items) => "CheckboxListTile $items");
  final itemsCheck = List<bool>.generate(20, (items) => false);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: itemsCheck[index],
            onChanged: (value) {
              setState(() {
                itemsCheck[index] = value;
              });
            },
            title: Text(items[index]),
            secondary: Icon(Icons.android),
            controlAffinity: ListTileControlAffinity.platform,
          );
        },
      ),
    );
  }
}
