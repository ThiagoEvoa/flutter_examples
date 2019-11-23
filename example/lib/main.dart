import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/firebase_store_service.dart';
import 'package:example/second_page.dart';
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
  _openSecondPage({DocumentSnapshot document}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SecondPage(document: document),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseStoreService().retrieve(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              default:
                {
                  return ListView(
                    children: snapshot.data.documents.map(
                      (document) {
                        return ListTile(
                          onTap: () {
                            _openSecondPage(document: document);
                          },
                          title: Text(
                            document['email'],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              FirebaseStoreService()
                                  .delete(document.documentID);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    ).toList(),
                  );
                }
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openSecondPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
