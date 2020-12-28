import 'package:example/detail.dart';
import 'package:example/post_api_service.dart';
import 'package:example/post_model.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

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
