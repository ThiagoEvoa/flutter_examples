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
  @override
  Widget build(BuildContext context) {
    Widget _smallWidget() {
      return Container(width: 50, height: 50, color: Colors.blueAccent);
    }

    Widget _mediumWidget() {
      return Container(width: 150, height: 150, color: Colors.yellow);
    }

    Widget _bigWidget() {
      return Container(width: 250, height: 250, color: Colors.blueGrey);
    }

    return Material(
      child: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          defaultColumnWidth: FractionColumnWidth(.3),
          columnWidths: {0: FractionColumnWidth(.4)},
          border: TableBorder.all(width: 3, color: Colors.grey[50]),
          children: [
            TableRow(
              children: [
                _smallWidget(),
                _mediumWidget(),
                _bigWidget(),
              ],
            ),
            TableRow(
              children: [
                _bigWidget(),
                _mediumWidget(),
                _smallWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
