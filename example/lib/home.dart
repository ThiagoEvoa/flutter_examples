import 'package:chopper/chopper.dart';
import 'package:example/detail.dart';
import 'package:example/post_api_service.dart';
import 'package:example/post_model.dart';
import 'package:flutter/material.dart';

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
