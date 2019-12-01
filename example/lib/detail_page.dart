import 'package:example/person.dart';
import 'package:example/person_dao.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  int index;
  Person person;

  DetailPage({this.index, this.person});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (widget.person == null) {
                PersonDao().insert(Person(name: _controller.text));
              } else {
                widget.person.name = _controller.text;
                PersonDao().update(widget.index, widget.person);
              }
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
} 