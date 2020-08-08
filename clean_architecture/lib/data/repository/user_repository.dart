import 'package:clean_architecture/data/datasource/user_dao.dart';
import 'package:clean_architecture/data/model/user_model.dart';
import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/repository/user_repository.dart';

class UserRepository implements IUserRepositorie {
  UserModel userModel = UserModel();

  @override
  Future<User> retrieveUser({User user}) async{
    return await userModel.login(user: user);
  }
}
