# Flare
<p align="center">
<img src="https://docs.google.com/uc?id=18gnZn8IBZS9noe_7LA0COiQ5yWPVqfBu" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FlareActor("flare/Teddy.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "idle"),
      ),
    );
  }
}
```
