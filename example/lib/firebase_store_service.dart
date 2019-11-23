import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseStoreService {
  Firestore _database;

  FirebaseStoreService() : _database = Firestore.instance;

  Stream<QuerySnapshot> retrieve() {
    return _database.collection('images').snapshots();
  }

  save({@required String name, @required String url}) {
    _database
        .collection('images')
        .document()
        .setData({'name': name, 'url': url});
  }

  delete({@required String id}) {
    _database.collection('images').document(id).delete();
  }
}
