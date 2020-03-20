# SelectableText
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/selectabletext.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Text copied'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SelectableText(
          'Click to copy the text',
          onTap: () {
            Clipboard.setData(
              ClipboardData(text: 'SelectableText Widget'),
            );
            _showSnackBar();
          },
        ),
      ),
    );
  }
}
```
