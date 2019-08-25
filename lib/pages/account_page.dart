import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  StepperType stepperType = StepperType.horizontal;
  int currentStep = 0;
  bool complete = false;
  next() {
    currentStep + 1 != _steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  switchStepType() {
    setState(() {
      stepperType == StepperType.horizontal
          ? stepperType = StepperType.vertical
          : stepperType = StepperType.horizontal;
    });
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  List<Step> _steps = [
    Step(
      title: Text('New Account'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
    ),
    Step(
      title: Text('Address'),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      title: Text('Avatar'),
      subtitle: Text('Error'),
      isActive: false,
      state: StepState.error,
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: _steps,
              type: stepperType,
              currentStep: currentStep,
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: (step) => goTo(step),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.change_history),
        onPressed: switchStepType,
      ),
    );
  }
}

goTo(int i) {}
