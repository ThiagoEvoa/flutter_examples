import 'package:clean_architecture/data/datasource/db_helper.dart';
import 'package:clean_architecture/domain/entity/user.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class UserDAO {
  Database database;
  Future<User> getUserByEmailPassword({@required User user}) async {
    database = await DBHelper().database;

    List<Map<String, dynamic>> result = await database.query('user',
        where: "email = ? AND password = ?",
        whereArgs: [user.email, user.password]);

    return User.fromJson(result.first);
  }
}
