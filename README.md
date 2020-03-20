# Scaffold
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/scaffold.png" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: FlutterLogo(),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        mini: false,
        tooltip: 'This is the FloatingActionButton',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
```
