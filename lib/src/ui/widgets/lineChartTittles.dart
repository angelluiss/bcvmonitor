// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      topTitles: SideTitles(
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
              return '1';
            case 5:
              return '2';
            case 8:
              return '3';
          }
          return '';
        },
        margin: 8,
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
      leftTitles: SideTitles(
        showTitles: false,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff67727d),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 35,
        margin: 12,
      ),
      rightTitles: SideTitles(
        showTitles: false,
      ));
}
