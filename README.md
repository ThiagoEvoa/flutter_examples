# Shimmer
<p align="center">
<img src="" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Shimmer(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey,
                Colors.grey[400],
                Colors.grey[350],
                Colors.grey[300],
                Colors.grey[200],
                Colors.grey[100],
                Colors.grey[50]
              ],
            ),
            child: Center(
              child: FlutterLogo(
                size: 400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
