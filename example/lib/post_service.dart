import 'dart:collection';
import 'dart:convert';

import 'package:example/post.dart';
import 'package:flutter/widgets.dart';
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
