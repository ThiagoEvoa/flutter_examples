# Hive
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/sqflite.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  hive: ^1.1.1
  hive_flutter: ^0.2.1
  path_provider: ^1.4.5
  hive_generator: ^0.5.2
  build_runner:
```

### Main
```dart
void main() async {
  await DBHelper.init();
  runApp(MyApp());
}

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
  _openPage({int index, Person person}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(index: index, person: person),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = PersonDao().get();

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: list.length <= 0
          ? Center(
              child: Text('No content =/'),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _openPage(index: index, person: list.getAt(index));
                  },
                  child: Card(
                    elevation: 5,
                    child: Dismissible(
                      key: Key(index.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          PersonDao().delete(index);
                          list.deleteAt(index);
                        });
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(list.getAt(index).name),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openPage();
        },
        tooltip: 'Add new person',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### DetailPage
```dart
class DetailPage extends StatefulWidget {
  int index;
  Person person;

  DetailPage({this.index, this.person});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (widget.person == null) {
                PersonDao().insert(Person(name: _controller.text));
              } else {
                widget.person.name = _controller.text;
                PersonDao().update(widget.index, widget.person);
              }
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
} 
```

### DBHelper
```dart
import 'package:path_provider/path_provider.dart' as path_provider;

class DBHelper {
  static init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.openBox('person');
    Hive.registerAdapter(PersonDao(), 0);
  }

  static close() {
    Hive.box('person').compact();
    Hive.close();
  }
}
```

### PersonDAO
```dart
class PersonDao implements TypeAdapter{
  Box _personBox;

  PersonDao(){
    _personBox = Hive.box('person');
  } 

  Box<dynamic> get() {
    return _personBox;
  }

  insert(Person person) {
    _personBox.add(person);
  }

  update(int index, Person person){
    _personBox.put(index, person);
  }

  delete(int id){
    _personBox.delete(id);
  }

  @override
  read(BinaryReader reader) {
    return null;
  }

  @override
  void write(BinaryWriter writer, obj) {
  }
}
```

### Person
```dart
@HiveType()
class Person {
  @HiveField(0)
  String name;

  Person({this.name});
}
```
