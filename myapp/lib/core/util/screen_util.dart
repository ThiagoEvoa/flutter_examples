import 'package:flutter/services.dart';

fullScreen(){
  SystemChrome.setEnabledSystemUIOverlays([]);
}

normalScreen(){
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}