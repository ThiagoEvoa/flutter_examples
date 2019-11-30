# Stack
<p align="center">
<img src="https://docs.google.com/uc?id=1v_jpbwUbOhEjLRrmEB2z4_S21FFjdAZo" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 150,
              width: 150,
              color: Colors.green,
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
```
