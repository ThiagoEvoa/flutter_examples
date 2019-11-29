# Image Asset
<p align="center">
<img src="https://docs.google.com/uc?id=16wfAz2b4zZTTIjq-p_HytriZYkMMnf_z" height="649" width="300">
</p>

### Dependencies
<p>On the root of the project, you should create the folder <b>images</b>, and add the image inside</p>

```dart
assets:
 - images/flutter.png
```

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
