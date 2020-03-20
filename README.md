# Drawer
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/drawer.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Drawer",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Example",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              selected: false,
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text(
                "Option 1",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```
