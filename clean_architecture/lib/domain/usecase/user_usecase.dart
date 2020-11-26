import 'package:clean_architecture/data/repository/user_repository.dart';
import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/repository/iuser_repository.dart';

class UserUseCase {
  IUserRepository _iUserRepository = UserRepository();

  Future<User> retrieveUser() {
    return _iUserRepository.retrieveUser();
  }
}
