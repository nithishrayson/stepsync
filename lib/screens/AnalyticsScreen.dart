import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Analyticsscreen extends StatelessWidget {
  const Analyticsscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {
        "label": "Heart Rate",
        "value": "78 bpm",
        "icon": Icons.favorite,
        "color": Colors.redAccent
      },
      {
        "label": "Water Intake",
        "value": "2.3 L",
        "icon": Icons.water_drop,
        "color": Colors.blueAccent
      },
      {
        "label": "Blood Pressure",
        "value": "120/80",
        "icon": Icons.monitor_heart,
        "color": Colors.purpleAccent
      },
      {
        "label": "Sleep",
        "value": "7h 40m",
        "icon": Icons.bedtime,
        "color": Colors.indigoAccent
      },
      {
        "label": "Steps",
        "value": "8,245",
        "icon": Icons.directions_walk,
        "color": Colors.greenAccent
      },
    ];

    final heights = [180.0, 210.0, 180.0, 210.0, 180.0];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("Analytics", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final metric = metrics[index];
            final cardHeight = heights[index % heights.length];

            return SizedBox(
              height: cardHeight,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: (metric["color"] as Color).withOpacity(0.25),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        metric["icon"] as IconData,
                        color: metric["color"] as Color,
                        size: 30,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        metric["label"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        metric["value"] as String,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}