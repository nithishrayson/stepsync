class WorkoutProgress {
  final int lastCompletedIndex;
  final DateTime timestamp;

  WorkoutProgress({
    required this.lastCompletedIndex,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'lastCompletedIndex': lastCompletedIndex,
    'timestamp': timestamp.toIso8601String(),
  };

  factory WorkoutProgress.fromJson(Map<String, dynamic> json) {
    return WorkoutProgress(
      lastCompletedIndex: json['lastCompletedIndex'] ?? 0,
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}