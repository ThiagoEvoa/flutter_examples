import 'package:clean_architecture/data/datasource/user_datasource.dart';
import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/repository/iuser_repository.dart';

class UserRepository implements IUserRepository {
  UserDataSource _userDataSource = UserDataSource();

  @override
  Future<User> retrieveUser() {
    return _userDataSource.retrieveUser();
  }
}
