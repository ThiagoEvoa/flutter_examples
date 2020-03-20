# RichText
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/richtext.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Rich ',
            style: TextStyle(color: Theme.of(context).primaryColor),
            children: <TextSpan>[
              TextSpan(
                text: 'Text',
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Widget',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
