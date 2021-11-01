import 'package:bcvapp/src/models/covid_model.dart';
import 'package:bcvapp/src/models/login_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<LoginModel> loginBCVMonitor() {
    return _provider.loginBCVMonitor();
  }
}

class NetworkError extends Error {}
