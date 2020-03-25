# Flare
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flare.gif" height="649" width="300">
</p>

### Dependencies
> On the root of the project, you need to create the folder <b>flare</b>, and add the file <b>.flr</b>

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
flare_flutter: ^1.7.3

assets:
 - flare/Teddy.flr
```

### Main
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
