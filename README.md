# Radio
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/radio.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  SexEnum _sexEnum = SexEnum.male;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Sex:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('male'),
                Radio(
                  value: SexEnum.male,
                  groupValue: _sexEnum,
                  onChanged: (value) {
                    setState(() {
                      _sexEnum = value;
                    });
                  },
                ),
                Text('female'),
                Radio(
                  value: SexEnum.female,
                  groupValue: _sexEnum,
                  onChanged: (value) {
                    setState(() {
                      _sexEnum = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```
