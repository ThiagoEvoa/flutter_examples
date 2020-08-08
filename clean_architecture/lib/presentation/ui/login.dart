import 'package:clean_architecture/domain/usecase/login_email_password.dart';
import 'package:clean_architecture/presentation/presenter/user_provider.dart';
import 'package:clean_architecture/presentation/widget/custom_button.dart';
import 'package:clean_architecture/presentation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  LoginWithEmailPassword loginWithEmailPassword = LoginWithEmailPassword();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _globalKey = GlobalKey<ScaffoldState>();

    return Consumer<UserProvider>(
      builder: (context, snapshot, widget) {
        return Scaffold(
          key: _globalKey,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextField(
                    controller: emailController,
                    label: 'login',
                  ),
                  CustomTextField(
                    controller: passwordController,
                    label: 'password',
                  ),
                  CustomButton(
                    onPressed: () {
                      snapshot.login(
                        email: emailController.text,
                        password: passwordController.text,
                        key: _globalKey,
                      );
                    },
                    label: 'login',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
