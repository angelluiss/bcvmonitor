class USDBalanceModel {
  late bool ok;
  late Resp resp;

  USDBalanceModel({required this.ok, required this.resp});

  USDBalanceModel.withError(String errorMessage);

  USDBalanceModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    resp = (json['resp'] != null ? Resp.fromJson(json['resp']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ok'] = ok;
    if (resp != null) {
      data['resp'] = resp.toJson();
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
