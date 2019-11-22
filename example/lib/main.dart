import 'package:example/detail_page.dart';
import 'package:example/person.dart';
import 'package:example/person_dao.dart';
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
      home: MyHomePage(),
    );
  }
}

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
