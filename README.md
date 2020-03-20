# Form
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/form.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) return 'Required Field';
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TextFormField',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) return null;
                },
                child: Text('Validate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
