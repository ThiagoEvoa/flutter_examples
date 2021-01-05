# SlideTransiction
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/slide_transition.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<Offset> _tween;

  @override
  void initState() {
    _tween = Tween(begin: Offset(0.0, 1), end: Offset(0.0, 0.0));
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _openAndCloseDraggableScrollableSheet(bool shouldOpen) {
      if (shouldOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    return Scaffold(
      appBar: AppBar(
      ),
      body: Stack(
        children: [
          RaisedButton(
            onPressed: () {
              _openAndCloseDraggableScrollableSheet(true);
            },
            child: Text('Open DraggableScrollableSheet'),
          ),
          SlideTransition(
            position: _tween.animate(_controller),
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.0,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  color: Theme.of(context).primaryColor,
                  child: ListView(
                    children: [
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            _openAndCloseDraggableScrollableSheet(false);
                          },
                          child: Text('Close DraggableScrollableSheet'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```
