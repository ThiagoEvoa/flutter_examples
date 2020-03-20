# Image Network
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/image.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.network(
            'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png'),
      ),
    );
  }
}
```
