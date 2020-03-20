# ExpansionPanel
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/expansionpanel.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _items = List<Item>.generate(
      20,
      (index) => Item(
          headerValue: 'Panel $index', expandedValue: 'This is item $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                _items[index].isExpanded = !isExpanded;
              });
            },
            children: _items.map<ExpansionPanel>(
              (Item item) {
                return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(item.headerValue),
                    );
                  },
                  body: ListTile(
                    onTap: () {
                      setState(() {
                        _items
                            .removeWhere((currentItem) => item == currentItem);
                      });
                    },
                    title: Text(item.expandedValue),
                    subtitle:
                        Text('To delete this panel, tap the trash can icon'),
                    trailing: Icon(Icons.delete),
                  ),
                  isExpanded: item.isExpanded,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
```
