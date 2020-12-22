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
  freezed_annotation: ^0.12.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: null
  freezed: ^0.12.6
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
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({String name, Address address}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

### Address
```dart
part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address{
  const factory Address({String street}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
```

