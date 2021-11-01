class BalanceModel {
  late bool ok;
  late List<Resp> resp;

  BalanceModel({required this.ok, required this.resp});

  BalanceModel.withError(String errorMessage);

  BalanceModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['resp'] != null) {
      resp = <Resp>[];
      json['resp'].forEach((v) {
        resp.add(Resp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ok'] = ok;
    if (resp != null) {
      data['resp'] = resp.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resp {
  late String name;
  late String country;
  late String valuedate;
  late double valuebuy;
  late double valuesale;

  Resp(
      {required this.name,
      required this.country,
      required this.valuedate,
      required this.valuebuy,
      required this.valuesale});

  Resp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    valuedate = json['valuedate'];
    valuebuy = json['valuebuy'];
    valuesale = json['valuesale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['country'] = country;
    data['valuedate'] = valuedate;
    data['valuebuy'] = valuebuy;
    data['valuesale'] = valuesale;
    return data;
  }
}
