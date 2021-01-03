import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  final items = List<String>.generate(20, (index) => "ListView Builder $index");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              title: Text(
                items[index],
              ),
            ),
            secondaryActions: [
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    items.removeAt(index);
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
