# Chopper
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/sqflite.gif" height="649" width="300">
</p>

### Dependencier

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.0
  moor_flutter: ^3.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  moor_generator: ^3.4.0
  build_runner:
```

### Generating code
> After make the implementation, you must run the command "flutter pub run build_runner build", in order to generate the boilerplate code to convert from and to json.

### Main
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
```

### HomePage
```dart
class _HomeState extends State<Home> {
  DBHelper _dbHelper;

  _openPage({PersonData person}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Detail(person: person, dbHelper: _dbHelper),
      ),
    );
  }

  @override
  void initState() {
    _dbHelper = DBHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: StreamBuilder<List<PersonData>>(
        stream: _dbHelper.personDAO.selectAll(),
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
                        _dbHelper.personDAO
                            .deletePerson(snapshot.data[index])
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
class Detail extends StatefulWidget {
  final PersonData person;
  final DBHelper dbHelper;

  Detail({this.person, this.dbHelper});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (widget.person == null) {
                widget.dbHelper.personDAO.insertPerson(
                    PersonCompanion(name: Value(_controller.text)));
              } else {
                widget.dbHelper.personDAO.updatePerson(
                    widget.person.copyWith(name: _controller.text));
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

### PersonDAO
```dart
part 'person_dao.g.dart';

@UseDao(tables: [Person])
class PersonDAO extends DatabaseAccessor<DBHelper> with _$PersonDAOMixin {
  final DBHelper dbHelper;

  PersonDAO(this.dbHelper) : super(dbHelper);

  Stream<List<PersonData>> selectAll() => select(person).watch();
  Future insertPerson(Insertable<PersonData> p) => into(person).insert(p);
  Future updatePerson(Insertable<PersonData> p) => update(person).replace(p);
  Future deletePerson(Insertable<PersonData> p) => delete(person).delete(p);
}
```

### Person
```dart
class Person extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
```

### DBHelper
```dart
part 'db_helper.g.dart';

@UseMoor(tables: [Person], daos: [PersonDAO])
class DBHelper extends _$DBHelper {
  DBHelper()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqflite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
```
