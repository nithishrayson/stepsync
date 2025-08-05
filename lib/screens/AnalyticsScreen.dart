import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stepsync/widgets/AnalyticsDashboard.dart';// Make sure this file contains a screen called AnalyticsDashboard

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> metrics = const [
    {
      "label": "Heart Rate",
      "value": "78 bpm",
      "icon": Icons.favorite,
      "color1": Color(0xFFff6e7f),
      "color2": Color(0xFFbfe9ff),
    },
    {
      "label": "Water Intake",
      "value": "2.3 L",
      "icon": Icons.water_drop,
      "color1": Color(0xFF43cea2),
      "color2": Color(0xFF185a9d),
    },
    {
      "label": "Blood Pressure",
      "value": "120/80",
      "icon": Icons.monitor_heart,
      "color1": Color(0xFFf7971e),
      "color2": Color(0xFFffd200),
    },
    {
      "label": "Sleep",
      "value": "7h 40m",
      "icon": Icons.bedtime,
      "color1": Color(0xFF614385),
      "color2": Color(0xFF516395),
    },
    {
      "label": "Steps",
      "value": "8,245",
      "icon": Icons.directions_walk,
      "color1": Color(0xFF56ab2f),
      "color2": Color(0xFFa8e063),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("Analytics", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final metric = metrics[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AnalyticsDashboard(
                      title: metric["label"],
                      icon: metric["icon"],
                      value: metric["value"],
                      color1: metric["color1"],
                      color2: metric["color2"],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [metric["color1"], metric["color2"]],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: metric["color2"].withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(metric["icon"], color: Colors.white, size: 36),
                    const SizedBox(height: 16),
                    Text(
                      metric["label"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      metric["value"],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
