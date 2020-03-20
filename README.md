# AnimatedPositioned
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/animatedpositioned.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  static double height = 60.0;
  double width = height * 4.0;
  double left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue[100]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Left',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: height / 3.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Right',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: height / 3.0),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 3),
              curve: Curves.easeIn,
              left: left,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (left == 0.0) {
                      left += width / 2.0;
                    } else {
                      left -= width / 2.0;
                    }
                  });
                },
                child: Container(
                  height: height,
                  width: width / 2.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      left == 0.0 ? 'Left' : 'Right',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
