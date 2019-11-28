# TabBar
<p align="center">
<img src="https://docs.google.com/uc?id=1e04GUx06-cAtLv33MxKF_0mPWktJA3oC" height="649" width="300">
</p>

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Tab1",
              ),
              Tab(
                text: "Tab2",
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Page1(),
              Page2(),
            ],
          ),
        ),
      ),
    );
  }
}
```
