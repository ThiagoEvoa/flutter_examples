import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer player;

  _playMusic({@required String url}) async {
    await player.play(url);
  }

  _stopMusic() async {
    await player.stop();
  }

  @override
  void initState() {
    player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                onPressed: () {
                  _playMusic(
                    url:
                        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
                  );
                },
                icon: Icon(Icons.play_arrow),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  _stopMusic();
                },
                icon: Icon(Icons.stop),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
