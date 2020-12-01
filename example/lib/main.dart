import 'dart:io';

import 'package:example/base64_image_util.dart';
import 'package:example/db_helper.dart';
import 'package:example/photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  Future<File> imageFile;
  Image image;
  DBHelper dbHelper;
  List<Photo> photos = [];

  @override
  void initState() {
    dbHelper = DBHelper();
    refreshImages();
    super.initState();
  }

  refreshImages() {
    dbHelper.getPhotos().then((value) {
      setState(() {
        photos.clear();
        photos.addAll(value);
      });
    });
  }

  pickImageFromGallery() {
    ImagePicker().getImage(source: ImageSource.gallery).then((file) {
      file.readAsBytes().then((value) {
        String imageString = Base64ImageUtil.base64String(data: value);
        Photo photo = Photo(id: 0, name: imageString);
        dbHelper.save(photo);
        refreshImages();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Base64ImageUtil.imageFromBase64String(
              base64String: photos[index].name);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImageFromGallery,
        child: Icon(Icons.camera),
      ),
    );
  }
}
