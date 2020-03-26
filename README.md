# FilePicker
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/filepicker.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  file_picker: ^1.5.0+2
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  File _file;
  List<File> _files;

  _getFile() async {
    _file = await FilePicker.getFile();
  }

  _getMultipleFile() async {
    _files = await FilePicker.getMultiFile();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: IconButton(
        onPressed: _getFile,
        icon: Icon(Icons.folder),
      ),
    ));
  }
}
```
