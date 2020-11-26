import 'package:clean_architecture/domain/entity/user.dart';

abstract class IUserRepository {
  Future<User> retrieveUser();
}
