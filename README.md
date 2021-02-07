# Camera

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  camera:
  path_provider:
  path:
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  CameraController _controller;
  String path;

  initCamera() {
    availableCameras().then((cameras) {
      _controller = CameraController(cameras[1], ResolutionPreset.low);
      _controller.initialize().then((_) async {
        if (!mounted) {
          return;
        }
        XFile result = await _controller.takePicture();
        setState(() {
          path = result.path;
        });
      });
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
            path == null ? CircularProgressIndicator() : Image.file(File(path)),
      ),
    );
  }
}
```
