# Firebase Storage
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/firebasestorage.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.2
  firebase_analytics: ^5.0.6
  cloud_firestore: ^0.12.10+2
  firebase_storage: ^3.0.8
  image_picker: ^0.6.2+1
```

### Main
```dart
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
```

### FirebaseStoreService
```dart
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
```

### FirebaseStorageService
```dart
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
```
