# IconButton
<p align="center">
<img src="https://docs.google.com/uc?id=1BcjTnbRkfR97PnwMD0lPGaKvDUu_cFcd" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: IconButton(
          onPressed: () {},
          color: Colors.blue,
          iconSize: 100,
          tooltip: 'IconButton',
          icon: Icon(Icons.android),
        ),
      ),
    );
  }
}
```
