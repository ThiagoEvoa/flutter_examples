# AnimatedContainer
<p align="center">
<img src="https://docs.google.com/uc?id=1WL0ggX_a79tzCSqNy5t5Bpn5kGbVdUSk" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  double _width = 200;
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _width += 100;
              _height += 100;
            });
          },
          onDoubleTap: () {
            setState(() {
              _width -= 100;
              _height -= 100;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            width: _width,
            height: _height,
            child: FlutterLogo(),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
```
