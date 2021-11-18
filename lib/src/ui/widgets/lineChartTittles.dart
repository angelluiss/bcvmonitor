// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData(List<String> x, List<double> y) => FlTitlesData(
      show: true,
      topTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(
        showTitles: false,
        reservedSize: 35,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff68737d),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          return y[value.toInt()].toString();
          // return DateTime.tryParse(x[value.toInt()]
          //         .replaceAll(RegExp(r'(am|pm)$'), "")
          //         .replaceAll("/", "-"))
          //     .toString();
        },
        margin: x.length.toDouble(),
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff68737d),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      rightTitles: SideTitles(
        showTitles: false,
      ));
}
