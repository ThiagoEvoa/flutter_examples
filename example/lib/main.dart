import 'package:flutter/material.dart';

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
  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Draggable(
                      feedback: FlutterLogo(
                        size: 80,
                      ),
                      childWhenDragging: Container(),
                      child: FlutterLogo(
                        size: 80,
                      ),
                      data: "flutter",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Draggable(
                      feedback: Icon(
                        Icons.android,
                        size: 80,
                      ),
                      childWhenDragging: Container(),
                      child: Icon(
                        Icons.android,
                        size: 80,
                      ),
                      data: "android",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: DragTarget(
                builder: (context, List<String> candidateData, rejectedData) {
                  return accept ? FlutterLogo(size: 80) : Container();
                },
                onWillAccept: (data) {
                  if (data == "flutter") return true;
                  return false;
                },
                onAccept: (data) {
                  accept = true;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
