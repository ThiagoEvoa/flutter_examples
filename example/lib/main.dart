import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
