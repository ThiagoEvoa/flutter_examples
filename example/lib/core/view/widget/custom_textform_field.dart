import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final void Function(String value) validator;
  final TextEditingController controller;
  final String labelText;

  const CustomTextFormField(
      {Key key, @required this.validator, this.controller, this.labelText})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}
