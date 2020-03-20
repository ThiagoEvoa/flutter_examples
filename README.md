# FlipCard
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flipcard.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  flip_card: ^0.4.4
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FlipCard(
                direction: FlipDirection.VERTICAL,
                front: Container(
                  height: 200,
                  width: 400,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    'Front Card',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                back: Container(
                  height: 200,
                  width: 400,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    'Front Card',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
            FlipCard(
              key: _cardKey,
              flipOnTouch: false,
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                height: 200,
                width: 400,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  'Front Card',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              back: Container(
                height: 200,
                width: 400,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  'Front Card',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () {
                  _cardKey.currentState.toggleCard();
                },
                child: Text('Flip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
