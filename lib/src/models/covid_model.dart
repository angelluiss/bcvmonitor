class CovidModel {
  late Global global;
  late List<Countries> countries;
  late String date;
  late String error;

  CovidModel(
      {required this.global, required this.countries, required this.date});

  CovidModel.withError(String errorMessage) {
    error = errorMessage;
  }

  CovidModel.fromJson(Map<String, dynamic> json) {
    global = (json['Global'] != null ? Global.fromJson(json['Global']) : null)!;
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries.add(Countries.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Global'] = global.toJson();
    data['Countries'] = countries.map((v) => v.toJson()).toList();
    data['Date'] = date;
    return data;
  }
}

class Global {
  late int newConfirmed;
  late int totalConfirmed;
  late int newDeaths;
  late int totalDeaths;
  late int newRecovered;
  late int totalRecovered;

  Global(
      {required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecovered,
      required this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    return data;
  }
}

class Countries {
  late String country;
  late String countryCode;
  late String slug;
  late int newConfirmed;
  late int totalConfirmed;
  late int newDeaths;
  late int totalDeaths;
  late int newRecovered;
  late int totalRecovered;
  late String date;

  Countries(
      {required this.country,
      required this.countryCode,
      required this.slug,
      required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecovered,
      required this.totalRecovered,
      required this.date});

  Countries.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Slug'] = slug;
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    return data;
  }
}
