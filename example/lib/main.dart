import 'dart:io';

import 'package:example/android_ar_screen.dart';
import 'package:example/ios_ar_screen.dart';
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
      home: Platform.isIOS ? IosARScreen() : AndroidARScreen(),
    );
  }
}
