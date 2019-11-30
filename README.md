# Icon
<p align="center">
<img src="https://docs.google.com/uc?id=1y21UssDjrcRf5CqM5_SMVHqvzL4m6HrU" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Icon(
          Icons.android,
          color: Colors.blue,
          size: 100,
          semanticLabel: 'Android icon',
        ),
      ),
    );
  }
}
```
