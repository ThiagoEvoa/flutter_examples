import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
