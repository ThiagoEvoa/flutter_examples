# WebView
<p align="center">
<img src="https://docs.google.com/uc?id=1oG9XALak13YizFDEVAcPZIZ0vh156iWJ" height="649" width="300">
</p>

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
