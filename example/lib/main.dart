import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  final list = List.generate(100, (index) => 'Item $index');
  ItemScrollController itemScrollController = ItemScrollController();

  scroll({@required int position}) {
    itemScrollController.scrollTo(
      index: position,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => scroll(position: 0),
                  child: Text('Go to top'),
                ),
                ElevatedButton(
                  onPressed: () => scroll(position: list.length ~/ 2),
                  child: Text('Go to middle'),
                ),
                ElevatedButton(
                  onPressed: () => scroll(position: list.length),
                  child: Text('Go to bottom'),
                ),
              ],
            ),
            Flexible(
              child: ScrollablePositionedList.builder(
                itemCount: list.length,
                itemScrollController: itemScrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      list[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
