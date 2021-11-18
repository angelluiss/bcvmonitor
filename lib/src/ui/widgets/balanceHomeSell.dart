// ignore_for_file: file_names

import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/models/usd_balance_model.dart';
import 'package:bcvapp/src/repository/api_repository.dart';
import 'package:bcvapp/src/ui/widgets/lineChartAmazing.dart';

import 'package:flutter/material.dart';

import 'package:loading_animations/loading_animations.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BalanceHomeSell extends StatelessWidget {
  final CardData card;
  final ApiRepository _apiRepository = ApiRepository();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  BalanceHomeSell({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
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
                builder: (BuildContext ctx,
                    AsyncSnapshot<USDBalanceModel> snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "\$",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${snapshot.data!.resp.valuesale.toStringAsFixed(2)} Bs.D ",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
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
                builder: (BuildContext ctx,
                    AsyncSnapshot<USDBalanceModel> snapshot) {
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
                            " ${snapshot.data!.resp.valuesale.toStringAsFixed(2)} Bs.D ",
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
                builder: (BuildContext ctx,
                    AsyncSnapshot<USDBalanceModel> snapshot) {
                  if (snapshot.hasData) {
                    var temp = DateTime.parse(
                        snapshot.data!.resp.valuedate.toString());
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
          ],
        ),
      ),
    );
  }
}
