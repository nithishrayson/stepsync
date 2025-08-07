import 'package:flutter/material.dart';
import 'package:stepsync/screens/ExerciseStartScreen.dart';
import 'package:stepsync/screens/WorkoutFlowScreen.dart'; 

class WorkoutDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const WorkoutDetailScreen({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  List<Map<String, String>> getExercises(String label) {
    switch (label) {
      case "Core Focus":
        return [
          {"name": "Plank", "duration": "30 sec"},
          {"name": "Russian Twists", "duration": "45 sec"},
          {"name": "Leg Raises", "duration": "12 reps"},
          {"name": "Mountain Climbers", "duration": "30 sec"},
          {"name": "Bicycle Crunches", "duration": "15 reps"},
          {"name": "Side Plank", "duration": "30 sec each side"},
          {"name": "Flutter Kicks", "duration": "30 sec"},
          {"name": "Reverse Crunches", "duration": "12 reps"},
          {"name": "Plank Shoulder Taps", "duration": "30 sec"},
          {"name": "V-Ups", "duration": "10 reps"},
          {"name": "Toe Touches", "duration": "15 reps"},
          {"name": "Hip Dips", "duration": "30 sec"},
          {"name": "Windshield Wipers", "duration": "10 reps each side"},
          {"name": "Boat Pose", "duration": "30 sec"},
          {"name": "Superman Exercise", "duration": "30 sec"},
        ];
      case "Lower Body":
        return [
          {"name": "Squats", "duration": "15 reps"},
          {"name": "Lunges", "duration": "12 reps"},
          {"name": "Glute Bridges", "duration": "30 sec"},
          {"name": "Donkey Kicks", "duration": "15 reps each side"},
          {"name": "Calf Raises", "duration": "20 reps"},
          {"name": "Hip Thrusts", "duration": "30 sec"},
          {"name": "Wall Sit", "duration": "30 sec"},
          {"name": "Side Lunges", "duration": "12 reps each side"},
          {"name": "Step-ups", "duration": "10 reps each leg"},
          {"name": "Leg Press", "duration": "15 reps"},
          {"name": "Sumo Squats", "duration": "12 reps"},
          {"name": "Single-leg Deadlifts", "duration": "10 reps each leg"},
          {"name": "Fire Hydrants", "duration": "15 reps each side"},
          {"name": "Curtsy Lunges", "duration": "12 reps each side"},
          {"name": "Box Jumps", "duration": "10 reps"},
        ];
      case "Upper Body":
        return [
          {"name": "Push-ups", "duration": "10 reps"},
          {"name": "Shoulder Press", "duration": "12 reps"},
          {"name": "Bent-over Rows", "duration": "10 reps"},
          {"name": "Tricep Dips", "duration": "12 reps"},
          {"name": "Bicep Curls", "duration": "15 reps"},
          {"name": "Lateral Raises", "duration": "12 reps"},
          {"name": "Chest Press", "duration": "12 reps"},
          {"name": "Plank to Push-up", "duration": "30 sec"},
          {"name": "Arnold Press", "duration": "12 reps"},
          {"name": "Face Pulls", "duration": "15 reps"},
          {"name": "Dumbbell Flyes", "duration": "12 reps"},
          {"name": "Inverted Rows", "duration": "10 reps"},
          {"name": "Skull Crushers", "duration": "12 reps"},
          {"name": "Push-up Variations", "duration": "10 reps"},
          {"name": "Wall Angels", "duration": "30 sec"},
        ];
      case "Muscle Specific":
        return [
          {"name": "Bicep Curls", "duration": "12 reps"},
          {"name": "Tricep Dips", "duration": "15 reps"},
          {"name": "Calf Raises", "duration": "20 reps"},
          {"name": "Shoulder Press", "duration": "12 reps"},
          {"name": "Lateral Raises", "duration": "15 reps"},
          {"name": "Chest Flyes", "duration": "12 reps"},
          {"name": "Bent-over Rows", "duration": "10 reps"},
          {"name": "Leg Extensions", "duration": "15 reps"},
          {"name": "Hamstring Curls", "duration": "12 reps"},
          {"name": "Glute Bridges", "duration": "30 sec"},
          {"name": "Plank Shoulder Taps", "duration": "30 sec"},
          {"name": "Russian Twists", "duration": "15 reps each side"},
          {"name": "Side Plank Dips", "duration": "10 reps each side"},
          {"name": "Reverse Flyes", "duration": "12 reps"},
          {"name": "Superman Exercise", "duration": "30 sec"},
        ];
      default:
        return [];
    }
  }

  String _getWorkoutDescription(String label) {
    switch (label) {
      case "Core Focus":
        return "This workout is designed to strengthen your abdominal and lower back muscles, which are essential for maintaining posture, balance, and overall body control.";
      case "Lower Body":
        return "Targeting your glutes, quads, hamstrings, and calves, this routine builds strength and endurance in your legs.";
      case "Upper Body":
        return "Focused on sculpting your chest, back, shoulders, and arms, this workout enhances your push-pull strength and muscular definition.";
      case "Muscle Specific":
        return "This routine isolates individual muscle groups such as biceps, triceps, shoulders, and calves.";
      default:
        return "A balanced routine for overall fitness, combining strength, endurance, and flexibility.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercises = getExercises(title);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 240,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What This Workout Builds",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getWorkoutDescription(title),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: exercises.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ExerciseStartScreen(
                              exerciseName: exercise['name']!,
                              duration: exercise['duration']!,
                            ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          exercise['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          exercise['duration']!,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton.extended(
          onPressed: () {
            List<Exercise> flowExercises =
                exercises.map((e) {
                  final seconds =
                      e['duration']!.contains("sec")
                          ? int.tryParse(
                                e['duration']!.replaceAll(
                                  RegExp(r'[^0-9]'),
                                  '',
                                ),
                              ) ??
                              30
                          : 30;
                  return Exercise(name: e['name']!, durationInSeconds: seconds);
                }).toList();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => WorkoutFlowScreen(
                      exercises: flowExercises,
                      startFromIndex: 0, 
                    ),
              ),
            );
          },
          backgroundColor: Colors.green,
          icon: const Icon(Icons.directions_run, color: Colors.black),
          label: const Text(
            "Start Workout",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
