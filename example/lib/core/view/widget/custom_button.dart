import 'dart:io';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const CustomButton({Key key, @required this.onPressed, this.label = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _iOSButton() : _androidButton();
  }

  Widget _androidButton() {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _iOSButton() {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
