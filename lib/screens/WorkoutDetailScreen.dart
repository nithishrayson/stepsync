import 'package:flutter/material.dart';

class Workoutdetailscreen extends StatefulWidget {
  const Workoutdetailscreen({super.key});

  @override
  State<Workoutdetailscreen> createState() => _WorkoutdetailscreenState();
}

class _WorkoutdetailscreenState extends State<Workoutdetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Workout Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text("Workout details will be shown here.")),
    );
  }
}
