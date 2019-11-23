import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/firebase_storage_service.dart';
import 'package:example/firebase_store_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final _key = GlobalKey<ScaffoldState>();

  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    _save(image);
  }

  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _save(image);
  }

  _save(File image) {
    if (image != null) {
      FirebaseStorageService().upload(image: image).then((result) {
        _showSnackBar('Yeah! We made it!');
      }).catchError((error) {
        _showSnackBar('Ops! something went wron!');
      });
    }
  }

  _delete(String name, String id) {
    FirebaseStorageService().delete(name: name, id: id).then((result) {
      _showSnackBar('Yeah! We made it!');
    }).catchError((error) {
      _showSnackBar('Ops! something went wron!');
    });
  }

  _showSnackBar(String message) {
    _key.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: _getImageFromCamera,
            icon: Icon(Icons.camera),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseStoreService().retrieve(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error));
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
                    children: snapshot.data.documents.map((document) {
                      return ListTile(
                        onLongPress: () {
                          _delete(document.data['name'], document.documentID);
                        },
                        title: Card(
                          child: Image.network(document.data['url']),
                        ),
                      );
                    }).toList(),
                  );
                }
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageFromGallery,
        child: Icon(Icons.image),
      ),
    );
  }
}
