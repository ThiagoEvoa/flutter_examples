import 'package:example/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;

class Detail extends StatefulWidget {
  final PersonData person;
  final DBHelper dbHelper;

  Detail({this.person, this.dbHelper});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (widget.person == null) {
                widget.dbHelper.personDAO.insertPerson(
                    PersonCompanion(name: Value(_controller.text)));
              } else {
                widget.dbHelper.personDAO.updatePerson(
                    widget.person.copyWith(name: _controller.text));
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
