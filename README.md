# Flavor Dart
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_dart.png" height="649" width="300">
</p>

<b>OBS: In order to run the project, execute the command "flutter run lib/main_dev.dart" on terminal. Just remember to replace de "dev" for the desired environment.</b>

### Main
```dart
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
```

### AppConfig
```dart
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final Widget child;

  AppConfig(
      {@required this.appTitle,
      @required this.buildFlavor,
      @required this.child});

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
```

### MainDev
```dart
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
```

### MainProd
```dart
import 'package:flutter/material.dart';
import 'package:example/app_config.dart';
import 'package:example/main.dart';

void main() {
  var appConfig = AppConfig(
    appTitle: 'Flutter Flavors Prod',
    buildFlavor: 'Production',
    child: MyApp(),
  );

  return runApp(appConfig);
}
```

### MyHomePage
```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```
