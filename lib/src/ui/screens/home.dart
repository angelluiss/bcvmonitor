import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/ui/screens/calculator.dart';
import 'package:bcvapp/src/ui/screens/covid_info.dart';
import 'package:bcvapp/src/ui/screens/list_currencies.dart';
import 'package:bcvapp/src/ui/screens/splash.dart';
import 'package:bcvapp/src/ui/widgets/balanceHome.dart';
import 'package:bcvapp/src/ui/widgets/balanceHomeSell.dart';
import 'package:bcvapp/src/ui/widgets/cardMenu.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: TabBar(
                    indicatorWeight: 1,
                    indicatorPadding: EdgeInsets.all(4),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    tabs: [
                      Tab(text: "Compra"),
                      Tab(text: "Venta"),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: TabBarView(
                    children: [
                      BalanceHome(card: cards[1]),
                      BalanceHomeSell(card: cards[1]),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  width: 400,
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 180,
                            child: ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CurrencyList()));
                                      break;
                                    case 1:
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CalculatorPage()));
                                      break;
                                    case 2:
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CovidPage()));
                                  }
                                },
                                title: CardDesign(
                                  card: cards[index],
                                )));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
