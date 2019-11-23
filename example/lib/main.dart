import 'package:example/detail.dart';
import 'package:example/post.dart';
import 'package:example/post_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
