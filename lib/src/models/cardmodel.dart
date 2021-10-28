// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CardData {
  final String balance;
  final String date;
  final String number;
  final Color color;
  final Icon icon;

  CardData(
      {required this.balance,
      required this.date,
      required this.number,
      required this.color,
      required this.icon});
}

List<CardData> cards = [
  CardData(
      balance: '23,532',
      date: '12/26',
      number: 'Tendencia',
      color: Colors.black,
      icon: const Icon(Icons.trending_up)),
  CardData(
      balance: '48,632',
      date: '01/23',
      number: 'Calculadora',
      color: Colors.white,
      icon: const Icon(Icons.calculate, color: Colors.white)),
  CardData(
      balance: '74,363',
      date: '07/24',
      number: 'Nosotros',
      color: Colors.white,
      icon: const Icon(Icons.info, color: Colors.white))
];

class LastInvestmentData {
  final int? value;
  final String? name;
  LastInvestmentData({this.value, this.name});
}

List<LastInvestmentData> lastInvestment = [
  LastInvestmentData(value: 33624, name: "Twitter, Inc. ao"),
  LastInvestmentData(value: 23864, name: "Tesla, Inc. ao"),
  LastInvestmentData(value: 20724, name: "Volkswagon, Inc.ao")
];

class Recommended {
  final String? name;
  final String? subtitle;
  final String? icon;
  final String? value;
  Recommended({this.name, this.subtitle, this.icon, this.value});
}

List<Recommended> recommendedList = [
  Recommended(
      name: "Netflix, Inc. ao",
      subtitle: "Blu-ray Disk, DVD",
      value: "+189%",
      icon: "assets/netflix.jpg"),
  Recommended(
      name: "Ozon, Inc. ao",
      subtitle: "Online store",
      value: "+173%",
      icon: "assets/ozon.jpg"),
  Recommended(
      name: "Tesla, Inc. ao",
      subtitle: "Automotive industry",
      value: "+189%",
      icon: "assets/tesla.jpg"),
];
