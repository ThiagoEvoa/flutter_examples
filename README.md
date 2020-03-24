# HTTP
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/http.gif" height="649" width="300">
</p>

### Dependencier

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  http: ^0.12.0+2
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  String _message;

  _openDetail({Post post}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            Detail(id: post?.id, title: post?.title, body: post?.body),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: FutureBuilder(
        future: PostService.fetch(context),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {
                      _openDetail(post: snapshot.data[index]);
                    },
                    leading: Text(snapshot.data[index].id.toString()),
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                    trailing: IconButton(
                      onPressed: () async {
                        _message = await PostService.delete(
                            snapshot.data[index], context);

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_message),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      },
                      icon: Icon(Icons.delete),
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
        onPressed: _openDetail,
        tooltip: 'Add Post',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### DetailPage
```dart
class Detail extends StatefulWidget {
  final int id;
  final String title;
  final String body;

  const Detail({this.id, this.title = "", this.body = ""});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _formKey = GlobalKey<FormState>();
  final _globalKey = GlobalKey<ScaffoldState>();
  Widget _form;
  String _message;

  _save(Post post) async {
    _message = await PostService.save(post, context);
    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(_message),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController(text: widget.title);
    final _bodyController = TextEditingController(text: widget.body);

    Widget _createForm() {
      _form = Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 10,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value.isEmpty) return 'Required field';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _bodyController,
                validator: (value) {
                  if (value.isEmpty) return 'Required field';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _save(
                        new Post(
                            id: widget?.id,
                            title: _titleController.text,
                            body: _bodyController.text),
                      );
                    }
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      );

      return _form;
    }

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: _form == null ? _createForm() : _form,
    );
  }
}
```

### PostService
```dart
import 'package:http/http.dart' as http;

class PostService {
  static final _url = 'https://jsonplaceholder.typicode.com/posts';
  static HashMap<String, String> _createHeader() {
    var _header = HashMap<String, String>();
    _header["Content-type"] = "application/json; charset=UTF-8";
    return _header;
  }

  static fetch(BuildContext context) async {
    final response = await http.get(_url);

    switch (response.statusCode) {
      case 200:
        {
          List<Post> list = Post.convertPostsToList(response.body);
          return list;
        }
      default:
        return 'Failed to retrieve posts';
    }
  }

  static save(Post post, BuildContext context) async {
    final response = post.id != null
        ? await http.put('$_url/${post.id}',
            headers: _createHeader(), body: jsonEncode(post))
        : await http.post(_url,
            headers: _createHeader(), body: jsonEncode(post));

    switch (response.statusCode) {
      case 200:
      case 201:
        {
          fetch(context);
          return 'Post saved';
        }
      default:
        return 'Failed to save post';
    }
  }

  static delete(Post post, BuildContext context) async {
    final response =
        await http.delete('$_url/${post.id}', headers: _createHeader());

    switch (response.statusCode) {
      case 200:
        {
          fetch(context);
          return 'Post deleted';
        }
      default:
        return 'Failed to delete post';
    }
  }
}
```

### Post
```dart
class Post {
  int id;
  String title;
  String body;
  int userId;

  Post({this.id, this.title, this.body, this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body, 'userId': userId};
  }

  static List<Post> convertPostsToList(String postsJson) {
    var jsonObject =
        (json.decode(postsJson) as List).cast<Map<String, dynamic>>();
    return jsonObject.map((value) => Post.fromJson(value)).toList();
  }
}
```
