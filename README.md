# Hive
<p align="center">
<img src="https://docs.google.com/uc?id=1b9uv4JwFgcHzDe9QVKjbdHH2uCHZ_7H3" height="649" width="300">
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
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('person');
  Hive.registerAdapter(PersonDao(), 0);

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
  void dispose() {
    Hive.box('person').compact();
    Hive.close();
    super.dispose();
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
class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;

  DBHelper._createInstance();

  factory DBHelper() {
    if (_dbHelper == null) return _dbHelper = DBHelper._createInstance();
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'local_database.db'),
      version: 1,
      onCreate: _createDatabase,
    );

    return db;
  }

  _createDatabase(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');
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
