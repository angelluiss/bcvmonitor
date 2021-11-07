import 'package:bcvapp/src/models/seriesModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StackedAreaLineChart extends StatelessWidget {
  final bool animate;

  StackedAreaLineChart({Key? key, this.animate = false}) : super(key: key);

  List<charts.Series<DeveloperSeries, num>> seriesList = [
    charts.Series(
        id: "developers",
        data: [
          DeveloperSeries(
            year: 2017,
            developers: 40000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          ),
          DeveloperSeries(
            year: 2018,
            developers: 5000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          ),
          DeveloperSeries(
            year: 2019,
            developers: 40000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          ),
          DeveloperSeries(
            year: 2020,
            developers: 35000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          ),
          DeveloperSeries(
            year: 2021,
            developers: 45000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          ),
        ],
        domainFn: (DeveloperSeries series, _) => series.year,
        measureFn: (DeveloperSeries series, _) => series.developers,
        colorFn: (DeveloperSeries series, _) => series.barColor)
  ];

  List<charts.Series<DeveloperSeries, num>> seriesList2 = [
    charts.Series(
        id: "developers",
        data: [
          DeveloperSeries(
            year: 2017,
            developers: 40000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          ),
        ],
        domainFn: (DeveloperSeries series, _) => series.year,
        measureFn: (DeveloperSeries series, _) => series.developers,
        colorFn: (DeveloperSeries series, _) => series.barColor)
  ];

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList,
        domainAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
          viewport: charts.NumericExtents(2016.0, 2022.0),
        ),
        defaultRenderer:
            charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
