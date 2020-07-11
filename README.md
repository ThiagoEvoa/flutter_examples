# AboutDialog
<p align="center">
<img src="" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationIcon: FlutterLogo(),
              applicationName: 'AboutDialog',
              applicationVersion: '1.0',
              applicationLegalese: 'blá blá blá',
            );
          },
          child: Text('Show AboutDialog'),
        ),
      ),
    );
  }
}
```
