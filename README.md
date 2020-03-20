# BottomNavigationBar
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/bottomnavigationbar.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;
  List<Widget> pages = [Page1(), Page2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            pages[_selectedItem],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[200],
        currentIndex: _selectedItem,
        onTap: (position) {
          setState(() {
            _selectedItem = position;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Bottom1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Bottom2"),
          ),
        ],
      ),
    );
  }
}
```
