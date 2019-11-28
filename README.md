# PopupMenuButton
<p align="center">
<img src="https://docs.google.com/uc?id=16IW3P0CXEM-wWoMePZM8qgGd50KHBF6W" height="649" width="300">
</p>

### Enum
```dart
enum MenuItens {option1, option2, option3}
```
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.menu),
            onSelected: (result) {},
            itemBuilder: (context) => <PopupMenuEntry<MenuItens>>[
              const PopupMenuItem<MenuItens>(
                value: MenuItens.option1,
                child: Text("First Option"),
              ),
              const PopupMenuItem<MenuItens>(
                value: MenuItens.option2,
                child: Text("Second Option"),
              ),
              const PopupMenuItem<MenuItens>(
                value: MenuItens.option3,
                child: Text("Third Option"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```
