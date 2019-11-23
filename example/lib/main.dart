import 'package:barcode_scan/barcode_scan.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _barCode = "";

  @override
  Widget build(BuildContext context) {
    Future _scan() async {
      try {
        String barCode = await BarcodeScanner.scan();
        setState(() {
          this._barCode = barCode;
        });
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          setState(() {
            this._barCode = 'The user did not grant the camera permission!';
          });
        } else {
          setState(() => this._barCode = 'Unknown error: $e');
        }
      } on FormatException {
        setState(() => this._barCode =
            'null (User returned using the "back"-button before scanning anything. Result)');
      } catch (e) {
        setState(() => this._barCode = 'Unknown error: $e');
      }
    }

    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: _scan,
              icon: Icon(Icons.camera),
            ),
            Text(
              this._barCode,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
