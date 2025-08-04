import 'package:flutter/material.dart';
import 'package:stepsync/screens/HomeScreen.dart';

void main() {
  runApp(StepSyncApp());
}

class StepSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StepSync',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
