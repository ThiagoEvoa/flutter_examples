# Image Asset
<p align="center">
<img src="https://docs.google.com/uc?id=16wfAz2b4zZTTIjq-p_HytriZYkMMnf_z" height="649" width="300">
</p>

### Dependencies
<p>On the root of the project, you need to create the folder <b>images</b>, and add the image inside</p>

#### Pubspec.yaml
```dart
assets:
 - images/flutter.png
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset('images/flutter.png'),
      ),
    );
  }
}
```
