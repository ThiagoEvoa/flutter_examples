import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _file;
  List<File> _files;

  _getFile() async {
    _file = await FilePicker.getFile();
  }

  _getMultipleFile() async {
    _files = await FilePicker.getMultiFile();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: IconButton(
        onPressed: _getFile,
        icon: Icon(Icons.folder),
      ),
    ));
  }
}
