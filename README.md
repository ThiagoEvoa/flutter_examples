# DatePicker
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/datepicker.gif" height="649" width="300">
</p>

#### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  date_format: ^1.0.8
```

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  final _dateTimeController = TextEditingController();

  Future _selectDate() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );

    if (dateTime != null) {
      setState(
        () {
          _dateTimeController.text =
              formatDate(dateTime, [dd, "/", mm, "/", yyyy]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TextField(
          controller: _dateTimeController,
          decoration: InputDecoration(
            labelText: "DatePicker",
            suffixIcon: IconButton(
              onPressed: _selectDate,
              icon: Icon(Icons.calendar_today),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
```
