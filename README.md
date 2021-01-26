# MaterialFloatingSearchBar
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/material_floating_search_bar.gif" height="649" width="300">
</p>

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  material_floating_search_bar: ^0.2.6

```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  FloatingSearchBarController _controller;
  static const historyLength = 4;
  List<String> foodItems = [
    'cheese',
    'wine',
    'meat',
    'bread',
  ];
  List<String> filteredFoodItems;
  String selectedItem;

  List<String> filteredSearchItems({@required String filter}) {
    if (filter != null && filter.isNotEmpty) {
      return foodItems.reversed
          .where((element) => element.startsWith(filter))
          .toList();
    } else {
      return foodItems.reversed.toList();
    }
  }

  addSearchItem({@required String item}) {
    if (foodItems.contains(item)) {
      putSearchItem(item: item);
      return;
    }

    foodItems.add(item);

    if (foodItems.length > historyLength) {
      foodItems.removeRange(0, foodItems.length - historyLength);
    }

    filteredFoodItems = filteredSearchItems(filter: null);
  }

  putSearchItem({@required String item}) {
    deleteSearchItem(item: item);
    addSearchItem(item: item);
  }

  deleteSearchItem({@required String item}) {
    foodItems.removeWhere((element) => element == item);
    filteredFoodItems = filteredSearchItems(filter: null);
  }

  @override
  void initState() {
    _controller = FloatingSearchBarController();
    filteredFoodItems = filteredSearchItems(filter: null);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
        controller: _controller,
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(selectedItem ?? 'Search food'),
        hint: 'Search food',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredFoodItems = filteredSearchItems(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchItem(item: query);
            selectedItem = query;
          });
          _controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredFoodItems.isEmpty && _controller.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text('Start searching'),
                    );
                  } else if (filteredFoodItems.isEmpty) {
                    return ListTile(
                      title: Text(_controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchItem(item: _controller.query);
                          selectedItem = _controller.query;
                        });
                        _controller.close();
                      },
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredFoodItems
                          .map(
                            (element) => ListTile(
                              title: Text(
                                element,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    deleteSearchItem(item: element);
                                  });
                                },
                                icon: Icon(Icons.clear),
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchItem(item: element);
                                  selectedItem = element;
                                });
                                _controller.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
        body: Builder(builder: (context) {
          final floatingSearchBar = FloatingSearchBar.of(context);

          return Padding(
            padding: EdgeInsets.only(
              top:
                  floatingSearchBar.height + floatingSearchBar.margins.vertical,
              left: 10,
            ),
            child: Text(selectedItem ?? ''),
          );
        }),
      ),
    );
  }
}
```
