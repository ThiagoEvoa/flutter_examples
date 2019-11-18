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
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GridView.builder(
        controller: _scrollController,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).size.width < 600 ? 2 : 3,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                items[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
