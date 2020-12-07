# Json_Serializable
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/json_serializable.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.0
  json_annotation: ^3.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^1.10.7
  json_serializable: ^3.5.1
```

### Generating code
> After make the implementation, you must run the command "flutter pub run build_runner build", in order to generate the boilerplate code to convert from and to json.


### Main
```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final json =
      '[{"name":"teste1","address":{"street":"Street1"}},{"name":"teste2","address":{"street":"Street2"}},{"name":"teste3","address":{"street":"Street3"}},{"name":"teste4","address":{"street":"Street4"}}]';

  Future<List<User>> _getUsers() async {
    return Future.delayed(Duration(seconds: 3), () {
      List<dynamic> data = jsonDecode(json);
      List<User> users = data.map((value) => User.fromJson(value)).toList();
      return users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<User>>(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].address.street),
                );
              },
            );
          }
        },
      ),
    );
  }
}
```

### User
```dart
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String name;
  final Address address;

  User({this.name, this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

### Address
```dart
part 'address.g.dart';

@JsonSerializable()
class Address {
  final String street;

  Address({this.street});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
```

