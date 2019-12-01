import 'package:example/detail_page.dart';
import 'package:example/person.dart';
import 'package:example/person_dao.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
