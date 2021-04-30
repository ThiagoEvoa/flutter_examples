import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:convert';

typedef HandleFacesDetection = Future<List<Face>> Function(
    FirebaseVisionImage image);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController _cameraController;
  ImageRotation _imageRotation;
  FaceDetector _faceDetector;
  XFile _xFile;
  Uint8List _file;
  bool _isCheckingImage = true;

  _initCamera() async {
    if (kIsWeb) {
      _file = await _takePicture();
      setState(() {});
    } else {
      List<CameraDescription> cameras = await availableCameras();
      int cameraIndex = cameras.indexWhere(
          (element) => element.lensDirection == CameraLensDirection.front);
      _imageRotation =
          _getImageRotation(cameras[cameraIndex].sensorOrientation);
      _cameraController = CameraController(
        cameras[cameraIndex],
        ResolutionPreset.max,
        enableAudio: false,
      );
      await _cameraController.initialize();
      _cameraController.startImageStream(_processImage);
    }
  }

  Future<void> _stopCamera() async {
    _cameraController.stopImageStream();
    _cameraController.dispose();
  }

  Future<Uint8List> _takePicture() async {
    Uint8List image;

    html.MediaStream stream =
        await html.window.navigator.getUserMedia(video: true);
    html.MediaStreamTrack track = stream.getVideoTracks()[0];
    html.ImageCapture imageCapture = html.ImageCapture(track);
    html.Blob photo = await imageCapture.takePhoto();
    html.FileReader reader = html.FileReader();
    reader.readAsDataUrl(photo.slice(0, photo.size, photo.type));
    reader.onLoadEnd.listen((event) {
      Uint8List data =
          Base64Decoder().convert(reader.result.toString().split(',').last);
      image = data;
    }).onData((data) {
      image = Base64Decoder().convert(reader.result.toString().split(',').last);
    });
    while (image == null) {
      await Future.delayed(Duration(milliseconds: 1));
      if (image != null) {
        break;
      }
    }
    return image;
  }


  Future<void> _processImage(CameraImage image) async {
    if (_isCheckingImage) {
      _isCheckingImage = false;
      List<Face> faces = await _detectFace(image, _faceDetector.processImage);
      if (faces.length > 0) {
        faces.sort(
          (a, b) => a.boundingBox.width.compareTo(b.boundingBox.width),
        );
        await _cameraController.stopImageStream();
        _xFile = await _cameraController.takePicture();
        setState(() {});
      }
      _isCheckingImage = true;
    }
  }

  Future<List<Face>> _detectFace(
    CameraImage image,
    HandleFacesDetection callback,
  ) async {
    return await callback(
      FirebaseVisionImage.fromBytes(
        _concatenatePlanes(image.planes),
        _buildMetaData(image),
      ),
    );
  }

  ImageRotation _getImageRotation(int rotation) {
    switch (rotation) {
      case 0:
        return ImageRotation.rotation0;
      case 90:
        return ImageRotation.rotation90;
      case 180:
        return ImageRotation.rotation180;
      default:
        assert(rotation == 270);
        return ImageRotation.rotation270;
    }
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    planes.forEach((plane) => allBytes.putUint8List(plane.bytes));
    return allBytes.done().buffer.asUint8List();
  }

  FirebaseVisionImageMetadata _buildMetaData(CameraImage image) {
    return FirebaseVisionImageMetadata(
      rawFormat: image.format.raw,
      rotation: _imageRotation,
      size: Size(
        image.width.toDouble(),
        image.height.toDouble(),
      ),
      planeData: image.planes
          .map(
            (plane) => FirebaseVisionImagePlaneMetadata(
              bytesPerRow: plane.bytesPerRow,
              height: image.height,
              width: image.width,
            ),
          )
          .toList(),
    );
  }

  Widget _setImage() {
    if (_xFile != null) {
      return Image.file(
        File('${_xFile.path}'),
        height: 300,
        width: 300,
      );
    } else {
      return Image.memory(_file);
    }
  }

  @override
  void initState() {
    _faceDetector = FirebaseVision.instance.faceDetector();
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: _file == null ? Text('detecting face...') : _setImage(),
      ),
    );
  }
}
