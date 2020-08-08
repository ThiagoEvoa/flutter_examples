import 'package:clean_architecture/data/repository/user_repository.dart';
import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/error/login_exception.dart';
import 'package:clean_architecture/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';

class LoginWithEmailPassword {
  IUserRepositorie userRepositorie = UserRepository();

  Future<String> login({@required User user}) async{
    if (_validateUserCredentials(user: user)) {
      User loginUser = await userRepositorie.retrieveUser(user: user);
      return loginUser.toJson().toString();
    } else {
      throw LoginException('invalid credentials');
    }
  }

  bool _validateUserCredentials({@required User user}) {
    return user.email.isNotEmpty || user.password.isNotEmpty;
  }
}
