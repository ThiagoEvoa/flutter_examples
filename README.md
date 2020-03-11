# Channel
<p align="center">
<img src="https://drive.google.com/open?id=1hyKPU-CoSXmn2WG7hU7RUosrP4asCYll" height="649" width="300">
<img src="https://drive.google.com/open?id=1eVZQ1vQnt5iNYz3Eh-_EftUsgEk3RPpW" height="649" width="300">
</p>

### Android
```dart
class MainActivity : FlutterActivity() {
    private val channel: String = "my_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        Handler(Looper.getMainLooper()).post {
            MethodChannel(flutterView, channel)
                    .setMethodCallHandler { call, result ->
                        if (call.method == "getMessage") {
                            result.success(getMessage())
                        } else {
                            result.notImplemented()
                        }
                    }
        }
    }

    private fun getMessage(): String {
        return "Android Channel"
    }
}
```

### iOS

```dart
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterBinaryMessenger
    let channel = FlutterMethodChannel(name: "my_channel", binaryMessenger: controller)
    
    DispatchQueue.main.async {
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard call.method == "getMessage" else{
                result(FlutterMethodNotImplemented)
                return
            }
            self.getMessage(result: result)
        })
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getMessage(result: FlutterResult){
        result("iOS Channel")
    }
}
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('my_channel');
  String _channelMessage = '';

  Future<void> _getChannelMessage() async{
    String channelMessage;
    try{
      channelMessage = await platform.invokeMethod('getMessage');
    }on PlatformException catch (e){
      channelMessage = e.toString();
    }

    setState(() {
      _channelMessage = channelMessage;
    });
  }

  @override
  void initState() {
    _getChannelMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(_channelMessage),
      ),
    );
  }
}
```
