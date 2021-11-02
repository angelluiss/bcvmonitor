// ignore_for_file: file_names

import 'package:bcvapp/src/models/seriesModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  const DeveloperChart({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, num>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor)
    ];

    return charts.LineChart(series,
        domainAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
          viewport: charts.NumericExtents(2016.0, 2022.0),
        ),
        animate: true);
  }
}
