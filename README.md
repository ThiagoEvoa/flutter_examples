# Pincode Fields
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/group_listview.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  group_list_view: ^1.0.6
```

### Main
```dart
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
```
