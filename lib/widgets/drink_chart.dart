import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DrinkChart extends StatelessWidget {
  const DrinkChart({super.key});
  final List<double> spending = const [100, 70, 90, 50, 60];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double barSpacing = constraints.maxWidth / spending.length;
        return SizedBox(
          height: 250,
          child: BarChart(
            BarChartData(
              barGroups: List.generate(spending.length, (index) {
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: spending[index],
                      width: 22,
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.shade400,
                    ),
                  ],
                );
              }),
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40, 
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index < spending.length) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                'images/beer-mug.png',
                                fit: BoxFit.contain, 
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "\$${spending[index]}",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
            ),
          ),
        );
      },
    );
  }
}
