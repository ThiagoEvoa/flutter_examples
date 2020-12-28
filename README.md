# Retrofit
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/http.gif" height="649" width="300">
</p>

### Dependencier

#### Pubspec.yaml
```dart
flutter:
  sdk: flutter
dio: ^3.0.10
json_annotation: ^3.1.1
retrofit: ^1.3.4+1
pretty_dio_logger: ^1.1.1
  
dev_dependencies:
flutter_test:
  sdk: flutter
build_runner:
json_serializable: ^3.5.1
retrofit_generator: ^1.4.1
```

### Generating code
> After make the implementation, you must run the command "flutter pub run build_runner build", in order to generate the boilerplate code to convert from and to json.


### HomePage
```dart
class _HomeState extends State<Home> {
  HttpResponse _message;
  PostApiService _postApiService;

  _openDetail({PostModel post}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            Detail(id: post?.id, title: post?.title, body: post?.body),
      ),
    );
  }

  @override
  void initState() {
    _postApiService = PostApiService.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _postApiService.fetch(),
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
                        _message =
                            await _postApiService.delete(snapshot.data[index]);

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_message.response.statusCode == 200
                                ? 'Post deleted'
                                : 'Failed to delete post'),
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
  PostApiService _postApiService;
  final _formKey = GlobalKey<FormState>();
  final _globalKey = GlobalKey<ScaffoldState>();
  Widget _form;
  HttpResponse _message;

  _save(PostModel post) async {
    if (widget.id == null) {
      _message = await _postApiService.save(post);
    } else {
      _message = await _postApiService.update(post, post.id.toString());
    }

    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(_message.response.statusCode == 200 ||
                _message.response.statusCode == 201
            ? 'Post saved'
            : 'Failed to save post'),
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
  void initState() {
    _postApiService = PostApiService.create();
    super.initState();
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
                      PostModel _postModel = PostModel(
                          id: widget?.id,
                          title: _titleController.text,
                          body: _bodyController.text);
                      _save(_postModel);
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

### PostApiService
```dart
part 'post_api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class PostApiService {
  factory PostApiService(Dio dio, {String baseUrl}) = _PostApiService;

  @GET('posts')
  Future<List<PostModel>> fetch();

  @POST('posts')
  Future<HttpResponse> save(@Body() PostModel postModel);

  @PUT('posts/{id}')
  Future<HttpResponse> update(@Body() PostModel postModel, @Path('id') String id);

  @DELETE('posts/{id}')
  Future<HttpResponse> delete(@Body() PostModel postModel);

  static PostApiService create() {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(PrettyDioLogger());

    return PostApiService(dio);
  }
}
```

### PostModel
```dart
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int id;
  String title;
  String body;
  int userId;

  PostModel({this.id, this.title, this.body, this.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
```
