# Video Player
<p align="center">
<!-- <img src="https://docs.google.com/uc?id=1T3bnJwFf6QfN_FNwiJb3-tFtYZpemrgD" height="649" width="300">
</p> -->
  
### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  audioplayers: ^0.14.0
```

### Main
```dart
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
```
