import 'package:flutter/material.dart';

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
