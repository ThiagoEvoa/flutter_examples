import 'package:flutter/foundation.dart';

class ListNotifier extends ChangeNotifier {
  final items = ValueNotifier<List<String>>([]);
  final hasMore = ValueNotifier<bool>(false);

  fetch() async {
    final result = await _fetch(items.value);

    if (result.length > 0 && result.length < 40) {
      hasMore.value = true;
      items.value = result;
    } else {
      hasMore.value = false;
    }
    items.notifyListeners();
  }

  Future<List<String>> _fetch(List<String> list) async {
    await Future.delayed(Duration(seconds: 3));
    return List<String>.generate(list.length + 20, (index) => 'Item: $index');
  }
}
