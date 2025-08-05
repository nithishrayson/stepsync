import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> discoverItems = [
    {"title": "HIIT Burn", "image": "assets/images/hiit.jpg"},
    {"title": "Yoga Flow", "image": "assets/images/yoga.jpg"},
    {"title": "Strength Core", "image": "assets/images/strength.jpg"},
    {"title": "Mobility Boost", "image": "assets/images/mobility.jpg"},
    {"title": "Heart Rate", "image": "assets/images/heart_rate.jpg"},
    {"title": "Water Intake", "image": "assets/images/water.jpg"},
    {"title": "Blood Pressure", "image": "assets/images/bp.jpg"},
    {"title": "Sleep Quality", "image": "assets/images/sleep.jpg"},
    {"title": "Nutrition", "image": "assets/images/nutrition.jpg"},
    {"title": "Mental Health", "image": "assets/images/mental_health.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("What's for you ", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search workouts...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onChanged: (query) {
                // Add search filtering here if needed
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemCount: discoverItems.length,
                itemBuilder: (context, index) {
                  final item = discoverItems[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: index.isEven ? 250 : 160,
                        ),
                        Container(
                          width: double.infinity,
                          height: index.isEven ? 250 : 160,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
