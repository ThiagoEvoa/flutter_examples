# Internationalization v2
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/internationalization.png" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  intl: ^0.17.0

flutter:
  generate: true
```

### Configuration 
<p>In the root of the project, you need  to create a folder with the name <b>assets</b> and inside of this folder create a folder with the name <b>translations</b>, now add your <b>.arb</b> files inside of it

### app_en.arb 
```dart
{
    "title":"English version",
    "phrase":"You have switched the version to english"
}
```

### app_pt.arb 
```dart
{
    "title":"Versão português",
    "phrase":"Você mudou a versão para português"
}
```

<p> In the root of the project, create a file with the name <b>l10n.yaml</b> and add the content below

### l10n.yaml
```dart
arb-dir: assets/translations
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

### Main
```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pt', ''),
      ],
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.phrase,
            ),
          ],
        ),
      ),
    );
  }
}
```
