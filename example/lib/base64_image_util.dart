

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class Base64ImageUtil{
  static Image imageFromBase64String({@required String base64String}){
    return Image.memory(base64Decode(base64String), fit: BoxFit.fill);
  }

  static Uint8List dataFromBase64String({@required String base64String}){
    return base64Decode(base64String);
  }

  static String base64String({@required Uint8List data}){
    return base64Encode(data);
  }
}