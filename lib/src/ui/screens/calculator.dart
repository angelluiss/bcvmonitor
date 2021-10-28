import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/ui/widgets/balanceHome.dart';
import 'package:bcvapp/src/ui/widgets/cardMenu.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final myControllerBSD = TextEditingController(text: "4,12");
  final myControllerUSD = TextEditingController(text: "1,00");

  @override
  void initState() {
    super.initState();
    myControllerBSD.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("Second text field: ${myControllerBSD.text}");

    setState(() {
      myControllerUSD.text = myControllerBSD.text;
    });
  }

  @override
  void dispose() {
    myControllerBSD.dispose();
    myControllerUSD.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Calculador"),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Bs.D",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                    controller: myControllerBSD,
                                    onChanged: (text) {
                                      print("First text field: $text");
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.swap_vert,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "USD",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                    controller: myControllerUSD,
                                    onChanged: (text) {
                                      print("First text field: $text");
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
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
