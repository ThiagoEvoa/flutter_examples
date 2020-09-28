import 'package:example/app_config.dart';
import 'package:example/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);

    return MaterialApp(
      title: appConfig.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appConfig.appTitle),
    );
  }
}