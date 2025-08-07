import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepsync/models/Workoutprogress.dart';

Future<void> saveProgress(WorkoutProgress progress) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('workout_progress', jsonEncode(progress.toJson()));
}

Future<WorkoutProgress?> loadProgress() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('workout_progress');
  if (jsonString == null) return null;

  final Map<String, dynamic> json = jsonDecode(jsonString);
  return WorkoutProgress.fromJson(json);
}
