# ListWheelScrollView
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/listwheelscrollview.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListWheelScrollView(
        itemExtent: 300,
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
```
