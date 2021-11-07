// ignore_for_file: file_names

import 'package:bcvapp/src/ui/widgets/lineChartTittles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff7FCC19),
    const Color(0xff6699D8),
  ];

  LineChartWidget({Key? key}) : super(key: key);

  List<String> x = [
    "20/10/21 00:00:00 am",
    "19/10/21 00:00:00 am",
    "18/10/21 00:00:00 am",
    "15/10/21 00:00:00 am",
    "14/10/21 00:00:00 am",
    "11/10/21 00:00:00 am",
    "13/10/21 00:00:00 am",
    "08/10/21 00:00:00 am",
    "07/10/21 00:00:00 am",
    "06/10/21 00:00:00 am",
    "05/10/21 00:00:00 am"
  ];

  List<double> y = [
    4.146009,
    4.1406225,
    4.128852,
    4.15149525,
    4.171146,
    4.15368975,
    4.152792,
    4.14471225,
    4.15508625,
    4.18401375,
    4.16506125
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.5))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
