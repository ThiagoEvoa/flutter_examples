# FilteringTextInputFormatter
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/filtering_text_input_formatter.gif" height="649" width="300">
</p>

### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s'))
              ],
              decoration: InputDecoration(hintText: 'Not allow space'),
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s'))
              ],
              decoration: InputDecoration(hintText: 'Only letters and space'),
            ),
            TextField(
              maxLength: 6,
              inputFormatters: [
                UpperCaseTextFormatter(),
                FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
              ],
              decoration:
                  InputDecoration(hintText: 'Only uppercase and number'),
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              decoration: InputDecoration(hintText: 'Amount input'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### UpperCaseTextFormatter
```dart
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
```
