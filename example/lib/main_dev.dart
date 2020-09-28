import 'package:flutter/material.dart';
import 'package:example/app_config.dart';
import 'package:example/main.dart';

void main() {
  var appConfig = AppConfig(
    appTitle: 'Flutter Flavors Dev',
    buildFlavor: 'Development',
    child: MyApp(),
  );

  return runApp(appConfig);
}