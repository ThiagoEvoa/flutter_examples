import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
