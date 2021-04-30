import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:html' as html;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  
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
      Uint8List data = Base64Decoder().convert(reader.result.toString().split(',').last);
      image = data;
    }).onData((data) {
      image = Base64Decoder().convert(reader.result.toString().split(',').last);
    });
    while(image == null){
      await Future.delayed(Duration(milliseconds: 1));
      if(image != null){
        break;
      }
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FutureBuilder(
          future: _takePicture(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading');
            } else {
              return Image.memory(snapshot.data);
            }
          },
        ),
      ),
    );
  }
}
