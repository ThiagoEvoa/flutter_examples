import 'package:clean_architecture/domain/entity/user.dart';
import 'package:flutter/widgets.dart';

abstract class IUserRepositorie {
  Future<User> retrieveUser({@required User user});
}
