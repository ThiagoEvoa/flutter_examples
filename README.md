# Transform
<p align="center">
<img src="https://docs.google.com/uc?id=1EqZe4zHEJGxfQnpPvRey6vC2bE_3q9IJ" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  double _angle = 0;
  double _scale = 1;
  Offset _offset = Offset(0, 0);
  double _skew = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Transform.rotate(
                      angle: _angle,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Transform.translate(
                      offset: _offset,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Transform(
                      transform: Matrix4.skewX(_skew),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _angle += pi / 4;
                      });
                    },
                    child: Text('Rotate'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _scale += 1;
                        });
                      },
                      child: Text('Scale'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _offset = Offset(50, 50);
                        });
                      },
                      child: Text('Translate'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _skew += 0.1;
                      });
                    },
                    child: Text('Skew'),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _angle = 0;
                  _scale = 1;
                  _offset = Offset(0, 0);
                  _skew = 0;
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
```
