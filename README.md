# Hero
<p align="center">
<img src="https://docs.google.com/uc?id=1zap8Z84mDgTq39dBWyHe54urEOtzRvW-" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.topLeft,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondAnimation) {
                  return SecondPage();
                },
                transitionDuration: Duration(seconds: 1),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Hero(
              tag: 'img',
              child: FlutterLogo(
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### SecondPage
```dart
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 400,
        height: 400,
        child: Hero(
          tag: 'img',
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
```
