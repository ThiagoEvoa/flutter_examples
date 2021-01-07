import 'dart:io';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String data;
  final bool shouldReplace;

  const SecondPage({this.data, this.shouldReplace});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Icon icon =
      Platform.isIOS ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.shouldReplace ? false : true,
      child: Scaffold(
        appBar: AppBar(
          leading: widget.shouldReplace
              ? Container()
              : IconButton(icon: icon, onPressed: () => Navigator.pop(context)),
        ),
        body: Center(
          child: Text(widget.data),
        ),
      ),
    );
  }
}
