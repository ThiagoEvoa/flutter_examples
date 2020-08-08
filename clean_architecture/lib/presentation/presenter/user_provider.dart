import 'package:clean_architecture/domain/entity/user.dart';
import 'package:clean_architecture/domain/usecase/login_email_password.dart';
import 'package:clean_architecture/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _message;
  LoginWithEmailPassword loginWithEmailPassword;

  UserProvider(this._message);

  String get getMessage => _message;

  login({String email, String password, GlobalKey<ScaffoldState> key}) {
    loginWithEmailPassword = LoginWithEmailPassword();
    loginWithEmailPassword
        .login(user: User(email: email, password: password))
        .then((value) {
      CustomSnackbar(key).showMessage(message: value);
    }).catchError((error) {
      CustomSnackbar(key).showMessage(message: error.getMessage());
    });
  }
}
