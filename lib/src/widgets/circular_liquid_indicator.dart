import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

// ignore: must_be_immutable
class CircularLiquidIndicator extends StatefulWidget {
  String status;
  CircularLiquidIndicator({Key? key, required this.status}) : super(key: key);

  @override
  _CircularLiquidIndicatorState createState() =>
      _CircularLiquidIndicatorState();
}

class _CircularLiquidIndicatorState extends State<CircularLiquidIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 200,
      height: 200,
      child: LiquidCircularProgressIndicator(
        value: 0.75, // Defaults to 0.5.
        valueColor: const AlwaysStoppedAnimation(
            Colors.black), // Defaults to the current Theme's accentColor.
        backgroundColor:
            Colors.white24, // Defaults to the current Theme's backgroundColor.
        borderColor: Colors.white54,
        borderWidth: 5.0,
        direction: Axis
            .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
        center: Text(
          widget.status,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
