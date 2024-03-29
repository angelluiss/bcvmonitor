import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/ui/widgets/balanceHome.dart';
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Compra"),
              Tab(text: "Venta"),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: TabBarView(
                    children: [
                      BalanceHome(card: cards[1]),
                      BalanceHome(card: cards[1]),
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
                                onTap: () {},
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
