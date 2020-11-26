import 'package:clean_architecture/domain/entity/user.dart';
import 'package:flutter/foundation.dart';

class UserModel extends User {
  final String name;

  UserModel({@required this.name}) : super(name);

  factory UserModel.fromJson({@required Map<String, dynamic> json}) {
    return UserModel(name: json['name']);
  }

  factory UserModel.fromUser({@required User user}) {
    return UserModel(name: user.name);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
