import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/usecase/user_usecase.dart';
import 'package:flutter/foundation.dart';

class UserViewModel extends ChangeNotifier{
  UserUseCase _userUseCase = UserUseCase();

  User _user;

  User get getUser => _user;

  retrieveUser() async{
    _user = await _userUseCase.retrieveUser();
    notifyListeners();
  }
}
