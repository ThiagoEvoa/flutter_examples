import 'package:flutter/material.dart';

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
  int _currentStep = 0;
  StepState _stepState = StepState.editing;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stepper(
        currentStep: _currentStep,
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text("Content"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: onStepContinue,
                      child: Text("Continue"),
                    ),
                  ),
                  RaisedButton(
                    onPressed: onStepCancel,
                    child: Text("Cancel"),
                  ),
                ],
              ),
            ],
          );
        },
        onStepContinue: () {
          setState(() {
            _currentStep++;
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep--;
          });
        },
        onStepTapped: (position) {
          setState(() {
            _currentStep = position;
          });
        },
        steps: <Step>[
          Step(
            state: _currentStep == 0 ? _stepState : StepState.indexed,
            content: Text("Title Step 1"),
            title: Text("Step 1"),
          ),
          Step(
            state: _currentStep == 1 ? _stepState : StepState.indexed,
            content: Text("Title Step 2"),
            title: Text("Step 2"),
          ),
          Step(
            state: _currentStep == 2 ? _stepState : StepState.indexed,
            content: Text("Title Step 3"),
            title: Text("Step 3"),
          ),
        ],
      ),
    );
  }
}
