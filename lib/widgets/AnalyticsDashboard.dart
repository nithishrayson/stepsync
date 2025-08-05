import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsDashboard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final Color color1;
  final Color color2;

  const AnalyticsDashboard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.color1,
    required this.color2,
  });

  static final List<FlSpot> _lineSpots = [
    FlSpot(0, 70),
    FlSpot(1, 78),
    FlSpot(2, 75),
    FlSpot(3, 80),
    FlSpot(4, 76),
    FlSpot(5, 82),
    FlSpot(6, 78),
  ];

  static final List<BarChartGroupData> _barGroups = List.generate(7, (index) {
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          toY: 70 + (index * 2 % 10),
          gradient: const LinearGradient(
            colors: [Colors.cyanAccent, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          width: 12,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  });

  static final List<PieChartSectionData> _pieSections = [
    PieChartSectionData(
      value: 40,
      color: Colors.cyanAccent,
      title: 'Steps\n40%',
      radius: 60,
      titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      value: 30,
      color: Colors.pinkAccent,
      title: 'Hydration\n30%',
      radius: 60,
      titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      value: 20,
      color: Colors.orangeAccent,
      title: 'Workout\n20%',
      radius: 60,
      titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      value: 10,
      color: Colors.greenAccent,
      title: 'Sleep\n10%',
      radius: 60,
      titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMetricCard(),
            const SizedBox(height: 32),
            _buildChartTitle("Trend Over Time"),
            const SizedBox(height: 16),
            _buildLineChart(),
            const SizedBox(height: 32),
            _buildChartTitle("Daily Comparison"),
            const SizedBox(height: 16),
            _buildBarChart(),
            const SizedBox(height: 32),
            _buildChartTitle("Activity Breakdown"),
            const SizedBox(height: 16),
            _buildPieChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color2.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 60, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget _buildLineChart() {
    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true, drawVerticalLine: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  );
                },
                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, _) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.white54, fontSize: 10),
                  );
                },
                interval: 5,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: _lineSpots,
              isCurved: true,
              color: Colors.cyanAccent,
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.cyanAccent.withOpacity(0.3),
              ),
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true, horizontalInterval: 5),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: _barGroups,
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return SizedBox(
      height: 240,
      child: PieChart(
        PieChartData(
          sections: _pieSections,
          centerSpaceRadius: 40,
          sectionsSpace: 2,
        ),
      ),
    );
  }
}
