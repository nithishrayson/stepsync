import 'package:flutter/material.dart';
import 'dart:async';

import 'package:stepsync/screens/WorkoutSummaryScreen.dart';

class Exercise {
  final String name;
  final int durationInSeconds;

  Exercise({required this.name, required this.durationInSeconds});
}

class WorkoutFlowScreen extends StatefulWidget {
  final List<Exercise> exercises;
  final int startFromIndex;

  const WorkoutFlowScreen({
    Key? key,
    required this.exercises,
    required this.startFromIndex,
  }) : super(key: key);

  @override
  State<WorkoutFlowScreen> createState() => _WorkoutFlowScreenState();
}

class _WorkoutFlowScreenState extends State<WorkoutFlowScreen> {
  int currentIndex = 0;
  bool isResting = false;
  int countdown = 0;
  Timer? timer;
  List<String> completedExercises = [];

  @override
  void initState() {
    super.initState();
    startCountdown(widget.exercises[currentIndex].durationInSeconds);
  }

  void startCountdown(int seconds) {
    countdown = seconds;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown == 0) {
        t.cancel();
        onStepComplete();
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  void onStepComplete() {
    completedExercises.add(widget.exercises[currentIndex].name);

    if (currentIndex < widget.exercises.length - 1) {
      setState(() {
        isResting = true;
      });

      Future.delayed(const Duration(seconds: 15), () {
        setState(() {
          currentIndex++;
          isResting = false;
        });
        startCountdown(widget.exercises[currentIndex].durationInSeconds);
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (_) =>
                  WorkoutSummaryScreen(completedExercises: completedExercises),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = widget.exercises[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Center(
        child:
            isResting
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.hourglass_bottom,
                      size: 80,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Rest Time",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Next exercise coming up...",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.fitness_center,
                      size: 80,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      current.name,
                      style: const TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Time Remaining",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "$countdown sec",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
