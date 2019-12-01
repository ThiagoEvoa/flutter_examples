# SqfLite
<p align="center">
<img src="https://docs.google.com/uc?id=1b9uv4JwFgcHzDe9QVKjbdHH2uCHZ_7H3" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^1.1.7+2
```

### Main
```dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _openPage({Person person}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(person: person),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: FutureBuilder<List<Person>>(
        future: PersonDao().get(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data.length > 0) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _openPage(person: snapshot.data[index]);
                  },
                  child: Card(
                    elevation: 5,
                    child: Dismissible(
                      key: Key(snapshot.data[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        PersonDao()
                            .delete(snapshot.data[index].id)
                            .whenComplete(() {
                          setState(() {
                            snapshot.data.removeAt(index);
                          });
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
                        child: Text(snapshot.data[index].name),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No content =/'),
            );
          }
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
  Person person;

  DetailPage({this.person});

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
                final person = Person(name: _controller.text);
                PersonDao().insert(person: person);
              } else {
                widget.person.name = _controller.text;
                PersonDao().update(person: widget.person);
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
class PersonDao {
  Future<List<Person>> get() async {
    Database db = await DBHelper().database;

    final List<Map<String, dynamic>> maps = await db.query('person');
    var people = List.generate(maps.length, (i) {
      return Person.fromJson(maps[i]);
    });
    return people;
  }

  Future<void> insert({Person person}) async {
    Database db = await DBHelper().database;

    await db.insert('person', person.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update({Person person}) async {
    Database db = await DBHelper().database;

    await db.update('person', person.toJson(),
        where: "id = ?", whereArgs: [person.id]);
  }

  Future<void> delete(int id) async {
    Database db = await DBHelper().database;

    await db.delete('person', where: "id = ?", whereArgs: [id]);
  }
}
```

### Person
```dart
class Person {
  int id;
  String name;

  Person({this.id, this.name});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

