import 'package:bcvapp/src/blocs/bcvmonitor/balance_bloc/balance_bloc.dart';
import 'package:bcvapp/src/models/balance_model.dart';
import 'package:bcvapp/src/widgets/circular_liquid_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  final BalanceBloc _newsBloc = BalanceBloc(const BalanceInitial());

  @override
  void initState() {
    _newsBloc.add(GetBalanceBCV());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monedas'),
        backgroundColor: Colors.black,
      ),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<BalanceBloc, BalanceState>(
          listener: (context, state) {
            if (state is BalanceError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<BalanceBloc, BalanceState>(
            builder: (context, state) {
              if (state is BalanceInitial) {
                return _buildLoading();
              } else if (state is BalanceLoading) {
                return _buildLoading();
              } else if (state is BalanceLoaded) {
                return _buildCard(context, state.balanceModel);
              } else if (state is BalanceError) {
                return Text(state.message);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, BalanceModel model) {
    return ListView.builder(
      itemCount: model.resp.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model.resp[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model.resp[index].country,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${model.resp[index].valuebuy.toStringAsFixed(2)} Bs.D",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${model.resp[index].valuesale.toStringAsFixed(2)} Bs.D",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() =>
      Center(child: CircularLiquidIndicator(status: 'Verificando'));
}
