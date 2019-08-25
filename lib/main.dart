import 'package:flutter/material.dart';
import 'package:stepper_flutter/pages/account_page.dart';
import 'package:stepper_flutter/pages/dropdown.dart';
import 'package:stepper_flutter/pages/stepper_with_forms.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepperWithForms(),
    );
  }
}
