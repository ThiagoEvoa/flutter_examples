# SliverAppBar
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/sliverappbar.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (items) => "Item $items");

    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: !innerBoxIsScrolled ? Container() : Text(widget.title),
              actions: <Widget>[
                !innerBoxIsScrolled
                    ? Container()
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      )
              ],
              backgroundColor: Colors.lightBlue[900],
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: !innerBoxIsScrolled ? Container() : Text(widget.title),
                background: FlutterLogo(),
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
```
