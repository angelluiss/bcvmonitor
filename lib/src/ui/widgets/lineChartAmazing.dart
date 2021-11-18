// ignore_for_file: file_names

import 'package:bcvapp/src/blocs/bcvmonitor/trend_home_bloc/trend_bloc.dart';
import 'package:bcvapp/src/ui/widgets/lineChartTittles.dart';
import 'package:bcvapp/src/widgets/circular_liquid_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LineChartWidget extends StatefulWidget {
  LineChartWidget({Key? key}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  final TrendsBloc _newsBloc = TrendsBloc(const TrendsInitial());

  final List<Color> gradientColors = [
    const Color(0xff7FCC19),
    const Color(0xff6699D8),
  ];

  List<String> x = [
    "20/10/21 00:00:00 am",
    "19/10/21 00:00:00 am",
    "18/10/21 00:00:00 am",
    "15/10/21 00:00:00 am",
    "14/10/21 00:00:00 am",
    "11/10/21 00:00:00 am",
    "13/10/21 00:00:00 am",
    "08/10/21 00:00:00 am",
    "07/10/21 00:00:00 am",
    "06/10/21 00:00:00 am",
    "05/10/21 00:00:00 am"
  ];

  List<double> y = [
    4.146009,
    4.1406225,
    4.128852,
    4.15149525,
    4.171146,
    4.15368975,
    4.152792,
    4.14471225,
    4.15508625,
    4.18401375,
    4.16506125
  ];

  @override
  void initState() {
    _newsBloc.add(GetTrends());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<TrendsBloc, TrendsState>(
          listener: (context, state) {
            if (state is TrendsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<TrendsBloc, TrendsState>(
            builder: (context, state) {
              if (state is TrendsInitial) {
                return _buildLoading();
              } else if (state is TrendsLoading) {
                return _buildLoading();
              } else if (state is TrendsLoaded) {
                return _linearChartAwesome(
                    state.trendsModel.x, state.trendsModel.y);
              } else if (state is TrendsError) {
                return Text(state.message);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      );

  _linearChartAwesome(List<String> x, List<double> y) {
    List<FlSpot> points = [FlSpot(0, y[0])];
    double index = 0;
    for (var element in y) {
      index += 1;

      points.add(FlSpot(index, element));
    }
    print(points);

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: x.length.toDouble(),
        minY: _getMin(y),
        maxY: _getMax(y),
        titlesData: LineTitles.getTitleData(x, y),
        gridData: FlGridData(
          show: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: false,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: points,
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            // dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _getMax(List<double> y) {
    double? max;
    for (var element in y) {
      if (max == null || element > max) {
        max = element;
      }
    }
    print("valox maximo $max");
    return max;
  }

  _getMin(List<double> y) {
    double? min;
    for (var element in y) {
      if (min == null || element < min) {
        min = element;
      }
    }
    print("valox minimo $min");
    return min;
  }

  Widget _buildLoading() =>
      Center(child: CircularLiquidIndicator(status: 'Verificando'));
}
