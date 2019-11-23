import 'dart:io';

import 'package:example/firebase_store_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  StorageReference _storage;

  FirebaseStorageService() : _storage = FirebaseStorage.instance.ref();

  Future<StorageTaskSnapshot> upload({@required File image}) async {
    var name = DateTime.now();
    final result =
        await _storage.child('image/$name').putFile(image).onComplete;
    final url = await result.ref.getDownloadURL();
    FirebaseStoreService().save(name: name.toString(), url: url);
    return result;
  }

  Future<void> delete({@required String name, @required String id}) async {
    await _storage.child('image/$name').delete();
    FirebaseStoreService().delete(id: id);
  }
}
