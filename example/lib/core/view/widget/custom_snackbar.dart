import 'package:flutter/material.dart';

showSnackBar(
    {@required GlobalKey<ScaffoldState> scaffolsKey,
    String label = '',
    @required String content}) {
  scaffolsKey.currentState.showSnackBar(
    SnackBar(
      action: SnackBarAction(
        onPressed: () {},
        label: label,
        textColor: Colors.white,
      ),
      content: Text(content),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ),
  );
}
