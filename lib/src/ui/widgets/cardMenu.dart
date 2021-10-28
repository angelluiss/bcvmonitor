// ignore_for_file: file_names

import 'package:bcvapp/src/models/cardmodel.dart';
import 'package:bcvapp/src/utils/constants.dart';
import 'package:blobs/blobs.dart';

import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  final CardData card;

  const CardDesign({Key? key, required this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width - 60,
        height: size.width - 60,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: card.color,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, offset: Offset(0, 0), blurRadius: 5)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            Positioned(
                bottom: 30,
                left: 10,
                right: 30,
                child: Text(
                  card.number,
                  style: TextStyle(
                      color: card.color == Colors.black
                          ? Colors.white
                          : Colors.black),
                )),
            Positioned(
              top: 20,
              left: 10,
              child: Container(
                width: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: card.color == Colors.black
                        ? Colors.white
                        : Colors.black),
                child: card.icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
