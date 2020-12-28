# Chopper
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/http.gif" height="649" width="300">
</p>

### Dependencier

#### Pubspec.yaml
```dart
flutter:
  sdk: flutter
chopper: ^3.0.6
json_annotation: ^3.1.1
cupertino_icons: ^1.0.0

dev_dependencies:
flutter_test:
  sdk: flutter
build_runner:
chopper_generator: ^3.0.6
json_serializable: ^3.5.1
```

### Generating code
> After make the implementation, you must run the command "flutter pub run build_runner build", in order to generate the boilerplate code to convert from and to json.

### Main
```dart
void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) { 
    print('${event.level.name}: ${event.time}: ${event.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
```

### HomePage
```dart
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Response _message;
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
  void dispose() {
    _postApiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: FutureBuilder(
        future: _postApiService.fetch(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.body.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {
                      _openDetail(post: snapshot.data.body[index]);
                    },
                    leading: Text(snapshot.data.body[index].id.toString()),
                    title: Text(snapshot.data.body[index].title),
                    subtitle: Text(snapshot.data.body[index].body),
                    trailing: IconButton(
                      onPressed: () async {
                        _message = await _postApiService
                            .delete(snapshot.data.body[index]);

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_message.statusCode == 200
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
  Response _message;

  _save(PostModel post) async {
    if (widget.id == null) {
      _message = await _postApiService.save(post);
    } else {
      _message = await _postApiService.update(post, post.id.toString());
    }

    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(_message.statusCode == 200 || _message.statusCode == 201
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
  void dispose() {
    _postApiService.dispose();
    super.dispose();
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
part 'post_api_service.chopper.dart';

@ChopperApi()
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<List<PostModel>>> fetch();

  @Post()
  Future<Response> save(@Body() PostModel postModel);

  @Put(path: '/{id}')
  Future<Response> update(@Body() PostModel postModel, @Path('id') String id);

  @Delete(path: '/{id}')
  Future<Response> delete(@Body() PostModel postModel);

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com/posts',
      services: [_$PostApiService()],
      converter: JsonSerializableConverter({
        PostModel: (jsonData) => PostModel.fromJson(jsonData),
      }),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$PostApiService(client);
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

### JsonSerializableConverter
```dart
typedef T JsonFactory<T>(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  JsonSerializableConverter(this.factories);

  T _decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map) return _decodeMap<T>(entity);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  // all objects should implements toJson method
  Request convertRequest(Request request) => super.convertRequest(request);
}
```
