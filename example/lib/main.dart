import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  Future<void> timer() {
    return Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: timer(),
        builder: (context, snapshot) {
          return Center(
            child: ShaderMask(
              blendMode: snapshot.connectionState == ConnectionState.waiting
                  ? BlendMode.lighten
                  : BlendMode.modulate,
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey,
                    Colors.grey,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                'This is the ShaderMask',
              ),
            ),
          );
        },
      ),
    );
  }
}
