import 'package:example/post.dart';
import 'package:example/post_service.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final int id;
  final String title;
  final String body;

  const Detail({this.id, this.title = "", this.body = ""});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _formKey = GlobalKey<FormState>();
  final _globalKey = GlobalKey<ScaffoldState>();
  Widget _form;
  String _message;

  _save(Post post) async {
    _message = await PostService.save(post, context);
    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(_message),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController(text: widget.title);
    final _bodyController = TextEditingController(text: widget.body);

    Widget _createForm() {
      _form = Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 10,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value.isEmpty) return 'Required field';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _bodyController,
                validator: (value) {
                  if (value.isEmpty) return 'Required field';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _save(
                        new Post(
                            id: widget?.id,
                            title: _titleController.text,
                            body: _bodyController.text),
                      );
                    }
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      );

      return _form;
    }

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: _form == null ? _createForm() : _form,
    );
  }
}
