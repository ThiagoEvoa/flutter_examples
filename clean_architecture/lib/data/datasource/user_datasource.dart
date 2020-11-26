import 'dart:convert';

import 'package:clean_architecture/data/model/user_model.dart';
import 'package:clean_architecture/domain/entity/user.dart';

class UserDataSource {
  Future<User> retrieveUser() {
    return Future.delayed(Duration(seconds: 3))
        .then((_) => UserModel.fromJson(json: {'name': 'Test user'}));
  }

  Future<void> postUser(User user) {
    return Future.delayed(Duration(seconds: 3))
        .then((_) => UserModel.fromUser(user: user).toJson());
  }
}
