# System Theme Mode
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/system_theme_mode.gif" height="649" width="300">
</p>

### Main
```dart
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late ThemeModeNotifier _themeModeNotifier;
  late final WidgetsBinding _widgetsBinding;
  late final FlutterWindow _window;

  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance!;
    _widgetsBinding.addObserver(this);
    _window = _widgetsBinding.window;
    _themeModeNotifier = ThemeModeNotifier(
      ValueNotifier<Brightness>(_window.platformDispatcher.platformBrightness),
    );
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    _themeModeNotifier.changeBrightness(brightness: _window.platformDispatcher.platformBrightness);
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Brightness>(
      valueListenable: _themeModeNotifier.appBrightness,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: value,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
```
