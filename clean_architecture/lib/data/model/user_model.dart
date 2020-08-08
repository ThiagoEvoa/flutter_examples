import 'package:clean_architecture/data/datasource/user_dao.dart';
import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/error/login_exception.dart';

class UserModel {
  Future<User> login({User user}) async {
    User result;
    try {
      result = await UserDAO().getUserByEmailPassword(user: user);
    } catch (exception) {
      throw LoginException('User not found');
    }
    return result;
  }
}
