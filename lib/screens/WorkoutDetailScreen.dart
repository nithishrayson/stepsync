import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const WorkoutDetailScreen({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  // Sample exercises based on workout title
  List<Map<String, String>> getExercises(String label) {
    switch (label) {
      case "Core Focus":
        return [
          {"name": "Plank", "duration": "30 sec"},
          {"name": "Russian Twists", "duration": "45 sec"},
          {"name": "Leg Raises", "duration": "12 reps"},
          {"name": "Mountain Climbers", "duration": "30 sec"},
          {"name": "Bicycle Crunches", "duration": "15 reps"},
          {"name": "Flutter Kicks", "duration": "30 sec"},
          {"name": "Side Plank", "duration": "20 sec each side"},
          {"name": "Sit-ups", "duration": "15 reps"},
          {"name": "Reverse Crunches", "duration": "12 reps"},
          {"name": "Plank Jacks", "duration": "30 sec"},
          {"name": "V-ups", "duration": "10 reps"},
          {"name": "Toe Touches", "duration": "15 reps"},
          {"name": "Heel Touches", "duration": "20 reps"},
          {"name": "Windshield Wipers", "duration": "10 reps each side"},
          {"name": "Boat Pose", "duration": "30 sec"},
        ];
      case "Lower Body":
        return [
          {"name": "Squats", "duration": "15 reps"},
          {"name": "Lunges", "duration": "12 reps"},
          {"name": "Glute Bridges", "duration": "30 sec"},
          {"name": "Donkey Kicks", "duration": "15 reps each side"},
          {"name": "Calf Raises", "duration": "20 reps"},
          {"name": "Leg Press", "duration": "12 reps"},
          {"name": "Wall Sit", "duration": "30 sec"},
          {"name": "Step-ups", "duration": "10 reps each leg"},
          {"name": "Hip Thrusts", "duration": "15 reps"},
          {"name": "Side Lunges", "duration": "12 reps each side"},
          {"name": "Fire Hydrants", "duration": "15 reps each side"},
          {"name": "Single-leg Deadlifts", "duration": "10 reps each leg"},
          {"name": "Curtsy Lunges", "duration": "12 reps each side"},
          {"name": "Sumo Squats", "duration": "15 reps"},
          {"name": "Leg Curls", "duration": "12 reps"},
        ];
      case "Upper Body":
        return [
          {"name": "Push-ups", "duration": "10 reps"},
          {"name": "Shoulder Press", "duration": "12 reps"},
          {"name": "Bent-over Rows", "duration": "10 reps"},
          {"name": "Push-up to T-Plank", "duration": "30 sec"},
          {"name": "Tricep Dips", "duration": "12 reps"},
          {"name": "Bicep Curls", "duration": "15 reps"},
          {"name": "Chest Press", "duration": "12 reps"},
          {"name": "Lateral Raises", "duration": "15 reps"},
          {"name": "Front Raises", "duration": "12 reps"},
          {"name": "Plank Shoulder Taps", "duration": "30 sec"},
          {"name": "Arnold Press", "duration": "10 reps"},
          {"name": "Dumbbell Flyes", "duration": "12 reps"},
          {"name": "Reverse Flyes", "duration": "12 reps"},
          {"name": "Skull Crushers", "duration": "10 reps"},
          {"name": "Face Pulls", "duration": "15 reps"},
        ];
      case "Muscle Specific":
        return [
          {"name": "Bicep Curls", "duration": "12 reps"},
          {"name": "Tricep Dips", "duration": "15 reps"},
          {"name": "Calf Raises", "duration": "20 reps"},
          {"name": "Shoulder Press", "duration": "12 reps"},
          {"name": "Chest Flyes", "duration": "10 reps"},
          {"name": "Lateral Raises", "duration": "15 reps"},
          {"name": "Front Raises", "duration": "12 reps"},
          {"name": "Bent-over Rows", "duration": "10 reps"},
          {"name": "Deadlifts", "duration": "12 reps"},
          {"name": "Plank Shoulder Taps", "duration": "30 sec"},
          {"name": "Push-ups", "duration": "10 reps"},
          {"name": "Skull Crushers", "duration": "10 reps"},
          {"name": "Face Pulls", "duration": "15 reps"},
          {"name": "Reverse Flyes", "duration": "12 reps"},
          {"name": "Arnold Press", "duration": "10 reps"},
        ];
      default:
        return [];
    }
  }

  String _getWorkoutDescription(String label) {
    switch (label) {
      case "Core Focus":
        return "This workout targets your abdominal and lower back muscles, helping you improve stability, posture, and overall balance — essential for nearly every movement.";
      case "Lower Body":
        return "Strengthens glutes, quads, hamstrings, and calves — key for improving mobility, power, and endurance. Perfect for anyone looking to build explosive legs.";
      case "Upper Body":
        return "Builds muscle in your chest, back, shoulders, and arms. Ideal for sculpting strength and enhancing push-pull capabilities in everyday tasks.";
      case "Muscle Specific":
        return "Designed to isolate key muscle groups like biceps, triceps, and calves. Great for toning and bulking based on targeted effort.";
      default:
        return "A balanced routine to improve your overall fitness, targeting multiple muscle groups and pushing you toward your full physical potential.";
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
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Start workout logic here
          },
          backgroundColor: Colors.green,
          icon: const Icon(Icons.directions_run, color: Colors.black),
          label: const Text(
            "Start Workout",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  Text(
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
                    style: TextStyle(
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
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return Container(
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
                );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
