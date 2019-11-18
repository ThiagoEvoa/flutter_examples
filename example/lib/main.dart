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
  final _timeOfDayController = TextEditingController();

  Future _selectTime() async {
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );

    if (timeOfDay != null) {
      setState(
        () {
          _timeOfDayController.text = timeOfDay.format(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TextField(
          controller: _timeOfDayController,
          onTap: () {
            _selectTime();
          },
          decoration: InputDecoration(
            labelText: "TimePicker",
            suffixIcon: Icon(Icons.timer),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
