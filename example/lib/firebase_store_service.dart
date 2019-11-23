import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreService {
  Firestore _database;

  FirebaseStoreService() : _database = Firestore.instance;

  Stream<QuerySnapshot> retrieve() {
    return _database.collection('people').snapshots();
  }

  save(String data) {
    _database.collection('people').document().setData({'email': data});
  }

  update(String id, String data) {
    _database.collection('people').document(id).updateData({'email': data});
  }

  delete(String id) {
    _database.collection('people').document(id).delete();
  }
}
