# Firebase Store
<p align="center">
<img src="https://docs.google.com/uc?id=14aQ9euTZDbbNok7aorRqcUAi2AhtbTo8" height="649" width="300">
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
```

### Main
```dart
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
```

### SecondPage
```dart
class SecondPage extends StatefulWidget {
  final DocumentSnapshot document;

  const SecondPage({this.document});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(
        text: widget.document == null ? '' : widget.document.data['email']);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            RaisedButton(
              onPressed: () {
                if (widget.document == null)
                  FirebaseStoreService().save(_controller.text);
                FirebaseStoreService()
                    .update(widget.document.documentID, _controller.text);

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
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
```
