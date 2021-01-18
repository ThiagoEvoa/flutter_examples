import 'package:example/list_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Flutter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterNotifier = ListNotifier();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _counterNotifier.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<List<String>>(
        valueListenable: _counterNotifier.items,
        builder: (context, value, snapshot) {
          if (value.length == 0) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: value.length + 1,
              itemBuilder: (context, index) {
                if (index < value.length) {
                  return ListTile(
                    title: Text('${value[index]}'),
                  );
                } else if (_counterNotifier.hasMore.value) {
                  _counterNotifier.fetch();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Center(child: Text('Nothing more to load')),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
