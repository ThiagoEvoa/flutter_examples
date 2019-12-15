import 'package:example/bottom_tab_item.dart';
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
  int _selectedItem = 0;
  List<Widget> pages = [Page1(), Page2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pages[_selectedItem],
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        elevation: 5,
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BottomTabItem(
                  onPressed: () {
                    setState(() {
                      _selectedItem = 0;
                    });
                  },
                  icon: Icons.home,
                  title: 'Page1',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: BottomTabItem(
                    title: 'Add',
                  ),
                ),
              ),
              Expanded(
                child: BottomTabItem(
                  onPressed: () {
                    setState(() {
                      _selectedItem = 1;
                    });
                  },
                  icon: Icons.home,
                  title: 'Page2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
