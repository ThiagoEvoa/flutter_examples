import 'dart:convert';

class Post {
  int id;
  String title;
  String body;
  int userId;

  Post({this.id, this.title, this.body, this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body, 'userId': userId};
  }

  static List<Post> convertPostsToList(String postsJson) {
    var jsonObject =
        (json.decode(postsJson) as List).cast<Map<String, dynamic>>();
    return jsonObject.map((value) => Post.fromJson(value)).toList();
  }
}
