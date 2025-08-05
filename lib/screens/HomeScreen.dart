import 'package:flutter/material.dart';
import 'package:stepsync/screens/ExploreScreen.dart';
import 'package:stepsync/screens/AnalyticsScreen.dart';
import '../widgets/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomeContent(),
    ExploreScreen(),
    AnalyticsScreen(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.rocket_launch,
    Icons.bar_chart_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: pages),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // ✅ Animated moving background
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              alignment:
                  _selectedIndex == 0
                      ? Alignment.centerLeft
                      : _selectedIndex == 1
                      ? Alignment.center
                      : Alignment.centerRight,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),

            // ✅ Navigation icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(icons.length, (index) {
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          color: isSelected ? Colors.black : Colors.white,
                          size: 24,
                        ),
                        if (isSelected) const SizedBox(width: 6),
                        if (isSelected)
                          Text(
                            index == 0
                                ? "Home"
                                : index == 1
                                ? "Explore"
                                : "Analytics",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
