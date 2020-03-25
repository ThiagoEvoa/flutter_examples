# Connectivity
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/connectivity.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  connectivity: ^0.4.8+2
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult;
  ConnectivityResult _connectivitySubscriptionResult;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  _checkConnectivity() async {
    _connectivityResult = await _connectivity.checkConnectivity();
    setState(() {});
  }

  _checkConnectivitySubscription() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      setState(() {
        _connectivitySubscriptionResult = result;
      });
    });
  }

  @override
  void initState() {
    _checkConnectivity();
    _checkConnectivitySubscription();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connectivity Subscription: ${_connectivitySubscriptionResult.toString()}',
            ),
            Text(
              'Check Connectivity: ${_connectivityResult.toString()}',
            ),
            RaisedButton(
              onPressed: _checkConnectivity,
              child: Text('Check Connectivity'),
            ),
          ],
        ),
      ),
    );
  }
}
```
