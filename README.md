# Video Player
<p align="center">
<!-- <img src="https://docs.google.com/uc?id=1T3bnJwFf6QfN_FNwiJb3-tFtYZpemrgD" height="649" width="300">
</p> -->

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController _playerController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=b_sQ9bMltGU&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=1')
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: _playerController.value.initialized
                ? AspectRatio(
                    aspectRatio: _playerController.value.aspectRatio,
                    child: VideoPlayer(_playerController),
                  )
                : Text('Ops!'),
          ),
          IconButton(
            onPressed: (){
              _playerController.value.isPlaying ? _playerController.pause() : _playerController.play();
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
```
