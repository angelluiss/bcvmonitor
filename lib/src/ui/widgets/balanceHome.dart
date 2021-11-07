// ignore_for_file: file_names

import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/models/seriesModel.dart';
import 'package:bcvapp/src/models/usd_balance_model.dart';
import 'package:bcvapp/src/repository/api_repository.dart';
import 'package:bcvapp/src/ui/widgets/lineChartAmazing.dart';
import 'package:bcvapp/src/utils/constants.dart';
import 'package:bcvapp/src/utils/share_preferences.dart';

import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:loading_animations/loading_animations.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BalanceHome extends StatelessWidget {
  final CardData card;
  final ApiRepository _apiRepository = ApiRepository();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  BalanceHome({Key? key, required this.card}) : super(key: key);

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
    return SizedBox(
      width: size.width,
      height: size.width - 60,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Tasa del día BCV",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          FutureBuilder(
              future: _apiRepository.getUSDBCVMonitor(),
              builder:
                  (BuildContext ctx, AsyncSnapshot<USDBalanceModel> snapshot) {
                if (snapshot.hasData) {
                  _saveIntoPreference(snapshot.data!);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "\$",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          " ${snapshot.data!.resp.valuebuy.toStringAsFixed(2)} Bs.D ",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  );
                }
                return LoadingFadingLine.circle(
                  size: 30,
                  backgroundColor: Colors.white,
                );
              }),
          FutureBuilder(
              future: _apiRepository.getEURBCVMonitor(),
              builder:
                  (BuildContext ctx, AsyncSnapshot<USDBalanceModel> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "€",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          " ${snapshot.data!.resp.valuebuy.toStringAsFixed(2)} Bs.D ",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  );
                }
                return LoadingFadingLine.circle(
                  size: 30,
                  backgroundColor: Colors.white,
                );
              }),
          FutureBuilder(
              future: _apiRepository.getEURBCVMonitor(),
              builder:
                  (BuildContext ctx, AsyncSnapshot<USDBalanceModel> snapshot) {
                if (snapshot.hasData) {
                  var temp =
                      DateTime.parse(snapshot.data!.resp.valuedate.toString());
                  var color = snapshot.data!.resp.growthValueBuy
                          .toString()
                          .contains("-")
                      ? Colors.redAccent
                      : Colors.greenAccent;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          temp.toLocal().day.toString() +
                              "-" +
                              temp.toLocal().month.toString() +
                              "-" +
                              temp.toLocal().year.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Icon(
                          snapshot.data!.resp.growthValueBuy
                                  .toString()
                                  .contains("-")
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: color),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "${double.parse(snapshot.data!.resp.growthValueSale).toStringAsFixed(2).replaceAll("-", "")} %",
                          style: TextStyle(color: color, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                }
                return LoadingFadingLine.circle(
                  size: 30,
                  backgroundColor: Colors.white,
                );
              }),
          Expanded(child: LineChartWidget()),
          // Expanded(
          //   child: StackedAreaLineChart(animate: true),
          // )
        ],
      ),
    );
  }

  _saveIntoPreference(USDBalanceModel data) {
    BCVPreferences.setStringValue(
        keyPreferenceUSDBuy, data.resp.valuebuy.toString());
    BCVPreferences.setStringValue(
        keyPreferenceUSDSell, data.resp.valuesale.toString());
  }
}
