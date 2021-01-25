# SearchDelegate
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/search_delegate.gif" height="649" width="300">
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
  List<String> foodItems = [
    'cheese',
    'wine',
    'meat',
    'bread',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: FoodSearchDelegate(list: foodItems),
            ),
          ),
        ],
      ),
      body: Center(),
    );
  }
}
```
### FoodSearchDelegate
```dart
class FoodSearchDelegate extends SearchDelegate<String> {
  final List<String> list;

  FoodSearchDelegate({@required this.list});

  @override
  String get searchFieldLabel => 'Food name';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredList = query.isEmpty
        ? list
        : list.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = filteredList[index];
            showResults(context);
          },
          title: Text(filteredList[index]),
        );
      },
    );
  }
}
```
