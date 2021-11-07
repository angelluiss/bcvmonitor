import 'package:bcvapp/src/models/balance_model.dart';
import 'package:bcvapp/src/models/covid_model.dart';
import 'package:bcvapp/src/models/login_model.dart';
import 'package:bcvapp/src/models/trends_model.dart';
import 'package:bcvapp/src/models/usd_balance_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<LoginModel> loginBCVMonitor() {
    return _provider.loginBCVMonitor();
  }

  Future<BalanceModel> getBalanceBCVMonitor() {
    return _provider.getBalanceMonitor();
  }

  Future<USDBalanceModel> getUSDBCVMonitor() {
    return _provider.getUSDMonitor();
  }

  Future<USDBalanceModel> getEURBCVMonitor() {
    return _provider.getEURMonitor();
  }

  Future<TrendsModel> getTrends(
      String startDate, String endDate, String currency, bool valuetype) {
    return _provider.getTrends(startDate, endDate, currency, valuetype);
  }
}

class NetworkError extends Error {}
