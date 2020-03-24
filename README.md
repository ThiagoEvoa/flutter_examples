# Placeholder
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/placeholder.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Placeholder(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Placeholder(
          color: Theme.of(context).primaryColor,
          strokeWidth: 1,
        ),
      ),
    );
  }
}
```
