# Image Network
<p align="center">
<img src="https://docs.google.com/uc?id=16wfAz2b4zZTTIjq-p_HytriZYkMMnf_z" height="649" width="300">
</p>

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
