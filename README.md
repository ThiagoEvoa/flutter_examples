# WebView
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/webview.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  webview_flutter: ^0.3.15+1
```

### Configuration

#### iOS Info.plist
```dart
<key>io.flutter.embedded_views_preview</key>
<string>YES</string>
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  WebViewController _controller;
  final String _flutter = 'https://flutter.dev/';
  final String _dart = 'https://dart.dev/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: WebView(
          initialUrl: _flutter,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController) {
            _controller = webViewController;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String currentUrl = await _controller.currentUrl();

          print(currentUrl.compareTo(_flutter));
          if (currentUrl.compareTo(_flutter) == 0) {
            _controller.loadUrl(_dart);
          } else {
            _controller.loadUrl(_flutter);
          }
        },
        child: Icon(Icons.web_asset),
      ),
    );
  }
}
```
