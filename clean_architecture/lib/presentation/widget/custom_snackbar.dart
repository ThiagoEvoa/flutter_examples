import 'package:flutter/material.dart';

class CustomSnackbar {
  final GlobalKey<ScaffoldState> globalKey;

  CustomSnackbar(this.globalKey);

  showMessage({String message}) {
    globalKey.currentState.showSnackBar(
      SnackBar(
        action: SnackBarAction(
          onPressed: () {},
          label: 'ok',
          textColor: Colors.white,
        ),
        content: Text(message),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
