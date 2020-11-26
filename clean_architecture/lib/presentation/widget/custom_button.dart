import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomButton({Key key, this.text = '', this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? RaisedButton(
            onPressed: onPressed,
            child: Text(text),
          )
        : CupertinoButton(
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
