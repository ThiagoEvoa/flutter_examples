import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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
  CameraController _controller;
  String path;

  initCamera() {
    availableCameras().then((cameras) {
      _controller = CameraController(cameras[1], ResolutionPreset.low);
      _controller.initialize().then((_) async {
        if (!mounted) {
          return;
        }
        XFile result = await _controller.takePicture();
        setState(() {
          path = result.path;
        });
      });
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
            path == null ? CircularProgressIndicator() : Image.file(File(path)),
      ),
    );
  }
}
