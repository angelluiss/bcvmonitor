class TrendsModel {
  late bool ok;
  late List<double> y;
  late List<String> x;

  TrendsModel({required this.ok, required this.y, required this.x});

  TrendsModel.withError(String errorMessage);

  TrendsModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    y = json['y'].cast<double>();
    x = json['x'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = ok;
    data['y'] = y;
    data['x'] = x;
    return data;
  }
}
