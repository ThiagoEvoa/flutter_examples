import 'package:example/db_helper.dart';
import 'package:example/detail.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

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
