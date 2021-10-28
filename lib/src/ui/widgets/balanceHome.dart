// ignore_for_file: file_names

import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/models/seriesModel.dart';
import 'package:bcvapp/src/ui/widgets/linechartwidget.dart';

import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import 'barChart.dart';

class BalanceHome extends StatelessWidget {
  final CardData card;

  BalanceHome({Key? key, required this.card}) : super(key: key);

  final List<DeveloperSeries> data = [
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
  ];

  List<charts.Series<DeveloperSeries, num>> series = [
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width - 60,
        height: size.width - 60,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Tasa del día BCV",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "\$",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    " 4,12 Bs.D ",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "€",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    " 4,12 Bs.D ",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
            const Text(
              "13-08-1921 13:05",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Expanded(
              child: StackedAreaLineChart(series, animate: true),
            )
          ],
        ),
      ),
    );
  }
}
