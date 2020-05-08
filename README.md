# DarkTheme Provider
<!--<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/state.gif" height="649" width="300">
</p> -->

### Main
```dart
void main() => runApp(
      Provider(
        create: (_) => ThemeProvider(false),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, snapshot, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: snapshot.getTheme,
          home: MyHomePage(),
        );
      },
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
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.1),
              bottom: BorderSide(width: 0.1),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text('Change Theme'),
              ),
              Switch(
                onChanged: (value) {
                  _value = value;
                  theme.setTheme(value);
                },
                value: _value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### ThemeProvider
```dart
class ThemeProvider extends ChangeNotifier {
  bool _isDarkThemeSelected;

  final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  ThemeProvider(this._isDarkThemeSelected);

  ThemeData get getTheme => _isDarkThemeSelected ? darkTheme : lightTheme;

  setTheme(bool isDarkThemeSelected) {
    this._isDarkThemeSelected = isDarkThemeSelected;
    notifyListeners();
  }
}
```
