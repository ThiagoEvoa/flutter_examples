# ImagePicker
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/imagepicker.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^0.6.7+4
```

### Configuration

#### iOS Info.plist
> Add those lines into the Info.plist, to be able to ask for user permission 

```dart
<key>NSPhotoLibraryUsageDescription</key>
<string>This app is requiring access to your gallery</string>
<key>NSCameraUsageDescription</key>
<string>This app is requiring access to your gallery</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app is requiring access to your microphone</string>
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future _getImageFromCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
    });
  }

  Future _getImageFromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: _image == null
                      ? Text(
                          "Pick an image",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        )
                      : Image.file(_image),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: _getImageFromCamera,
                    child: Icon(
                      Icons.camera_alt,
                      size: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: _getImageFromGallery,
                    child: Icon(
                      Icons.image,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
```
