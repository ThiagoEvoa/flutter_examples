# BottomAppBar
<p align="center">
<img src="https://docs.google.com/uc?id=1TOABRy1I48ek73yLdeB-tZAzR1l2R-Rh" height="649" width="300">
</p>

### Main
```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        elevation: 5,
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BottomTabItem(
                  onPressed: () {
                    setState(() {
                      _selectedItem = 0;
                    });
                  },
                  icon: Icons.home,
                  title: 'Page1',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: BottomTabItem(
                    title: 'Add',
                  ),
                ),
              ),
              Expanded(
                child: BottomTabItem(
                  onPressed: () {
                    setState(() {
                      _selectedItem = 1;
                    });
                  },
                  icon: Icons.home,
                  title: 'Page2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### BottomTabItem
```dart
class BottomTabItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function onPressed;

  BottomTabItem({this.icon, this.title, this.onPressed});

  @override
  _BottomTabItemState createState() => _BottomTabItemState();
}

class _BottomTabItemState extends State<BottomTabItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Column(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
```
