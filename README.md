# Base64 Image 
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/base64_image.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
    image_picker: ^0.6.7+14
    path_provider: ^1.6.24
    sqflite: ^1.3.2+1
```

### Configuration

#### iOS Info.plist
> Add those lines into the Info.plist, to be able to ask for user permission 

```dart
<key>NSPhotoLibraryUsageDescription</key>
<string>This app is requiring access to your gallery</string>
<key>NSCameraUsageDescription</key>
<string>This app is requiring access to your gallery</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app is requiring access to your microphone</string>
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Future<File> imageFile;
  Image image;
  DBHelper dbHelper;
  List<Photo> photos = [];

  @override
  void initState() {
    dbHelper = DBHelper();
    refreshImages();
    super.initState();
  }

  refreshImages() {
    dbHelper.getPhotos().then((value) {
      setState(() {
        photos.clear();
        photos.addAll(value);
      });
    });
  }

  pickImageFromGallery() {
    ImagePicker().getImage(source: ImageSource.gallery).then((file) {
      file.readAsBytes().then((value) {
        String imageString = Base64ImageUtil.base64String(data: value);
        Photo photo = Photo(id: 0, name: imageString);
        dbHelper.save(photo);
        refreshImages();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Base64ImageUtil.imageFromBase64String(
              base64String: photos[index].name);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImageFromGallery,
        child: Icon(Icons.camera),
      ),
    );
  }
}
```

### Base64ImageUtil
```dart
class Base64ImageUtil{
  static Image imageFromBase64String({@required String base64String}){
    return Image.memory(base64Decode(base64String), fit: BoxFit.fill);
  }

  static Uint8List dataFromBase64String({@required String base64String}){
    return base64Decode(base64String);
  }

  static String base64String({@required Uint8List data}){
    return base64Encode(data);
  }
}
```

### Photo
```dart
class Photo {
  int id;
  String name;

  Photo({this.id, this.name});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
```

### DBHelper
```dart
class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'PhotosTable';
  static const String DB_NAME = 'photos.db';

  Future<Database> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)");
  }

  Future<Photo> save(Photo photo) async {
    var dbClient = await db;
    photo.id = await dbClient.insert(TABLE, photo.toJson());
    return photo;
  }

  Future<List<Photo>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME]);
    List<Photo> photos = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        photos.add(Photo.fromJson(maps[i]));
      }
    }
    return photos;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
```
