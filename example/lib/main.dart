import 'package:example/person.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  Map<String, List> mapList;
  List<Person> people = List<Person>.generate(
    20,
    (index) => Person('Person $index', index.isOdd ? 'Team Odd' : 'Team Even'),
  );

  Map<String, List> createMapList() {
    Map<String, List<Person>> map = {};

    people.forEach((element) {
      if (!map.containsKey(element.category)) {
        map[element.category] = [];
      }

      map[element.category].add(element);
    });

    return map;
  }

  @override
  void initState() {
    mapList = createMapList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GroupListView(
          sectionsCount: mapList.length,
          countOfItemInSection: (int section) {
            return mapList.values.toList()[section].length;
          },
          itemBuilder: (BuildContext context, IndexPath index) {
            return Card(
              child: ListTile(
                title: Text(
                  mapList.values.toList()[index.section][index.index].name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
          groupHeaderBuilder: (BuildContext context, int section) {
            return Text(
              mapList.keys.toList()[section],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
        ),
      ),
    );
  }
}
