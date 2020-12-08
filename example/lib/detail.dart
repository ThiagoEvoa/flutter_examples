import 'package:chopper/chopper.dart';
import 'package:example/post_api_service.dart';
import 'package:example/post_model.dart';
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
  PostApiService _postApiService;
  final _formKey = GlobalKey<FormState>();
  final _globalKey = GlobalKey<ScaffoldState>();
  Widget _form;
  Response _message;

  _save(PostModel post) async {
    if (widget.id == null) {
      _message = await _postApiService.save(post);
    } else {
      _message = await _postApiService.update(post, post.id.toString());
    }

    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(_message.statusCode == 200 || _message.statusCode == 200
            ? 'Post saved'
            : 'Failed to save post'),
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
  void initState() {
    _postApiService = PostApiService.create();
    super.initState();
  }

  @override
  void dispose() {
    _postApiService.dispose();
    super.dispose();
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
                      PostModel _postModel = PostModel(
                          id: widget?.id,
                          title: _titleController.text,
                          body: _bodyController.text);
                      _save(_postModel);
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
