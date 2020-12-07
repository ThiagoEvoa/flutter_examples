import 'dart:convert';

import 'package:example/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
