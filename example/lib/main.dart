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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.1,
        maxChildSize: 0.8,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.network(
                        'https://flutter.dev/assets/homepage/carousel/phone_bezel-467ab8d838e5e2d2d3f347f766173ccc365220223692215416e4ce7342f2212f.png'),
                    Center(
                      child: FlutterLogo(
                        size: 200,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
