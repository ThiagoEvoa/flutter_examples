# ListView
<p align="center">
<img src="https://docs.google.com/uc?id=12e2ABkffgKQDrsqF_cqNPbkIjlElFyrR" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Listview"),
            subtitle: Text("Simple Listview example"),
            trailing: Icon(Icons.delete),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Listview"),
            subtitle: Text("Simple Listview example"),
            trailing: Icon(Icons.delete),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Listview"),
            subtitle: Text("Simple Listview example"),
            trailing: Icon(Icons.delete),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Listview"),
            subtitle: Text("Simple Listview example"),
            trailing: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
```
