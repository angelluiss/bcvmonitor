// ignore_for_file: avoid_print

import 'package:bcvapp/src/models/balance_model.dart';
import 'package:bcvapp/src/models/covid_model.dart';
import 'package:bcvapp/src/models/login_model.dart';
import 'package:bcvapp/src/models/trends_model.dart';
import 'package:bcvapp/src/models/usd_balance_model.dart';
import 'package:bcvapp/src/utils/share_preferences.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';
  final String _urlBCV = 'https://bcv-currencies.herokuapp.com/';
  final String _loginEndPoint = 'api/login';
  final String _balanceEndPoint = 'api/currency/name';
  final String _trendsEndPoint = 'api/currency/range';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

  Future<LoginModel> loginBCVMonitor() async {
    dynamic body = {'email': 'monitor02@thinkering.com', 'password': '1234'};
    try {
      Response response = await _dio.post(_urlBCV + _loginEndPoint, data: body);

      print(response.data);
      return LoginModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return LoginModel.withError("Data not found / Connection issue");
    }
  }

  Future<BalanceModel> getBalanceMonitor() async {
    String token = await BCVPreferences.getToken();
    try {
      _dio.options.headers["x-token"] = token;
      Response response = await _dio.post(_urlBCV + _balanceEndPoint);
      print(response.data);
      return BalanceModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BalanceModel.withError("Data not found / Connection issue");
    }
  }

  Future<USDBalanceModel> getUSDMonitor() async {
    String token = await BCVPreferences.getToken();
    dynamic body = {'currencyType': 'USD', 'valueType': 'valuebuy'};
    try {
      _dio.options.headers["x-token"] = token;
      Response response =
          await _dio.post(_urlBCV + _balanceEndPoint, data: body);
      print(response.data);
      return USDBalanceModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return USDBalanceModel.withError("Data not found / Connection issue");
    }
  }

  Future<USDBalanceModel> getEURMonitor() async {
    String token = await BCVPreferences.getToken();
    dynamic body = {'currencyType': 'EUR', 'valueType': 'valuebuy'};
    try {
      _dio.options.headers["x-token"] = token;
      Response response =
          await _dio.post(_urlBCV + _balanceEndPoint, data: body);
      print(response.data);
      return USDBalanceModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return USDBalanceModel.withError("Data not found / Connection issue");
    }
  }

  Future<TrendsModel> getTrends(
      String startDate, String endDate, String currency, bool valuetype) async {
    String token = await BCVPreferences.getToken();

    dynamic body = {
      "startDate": startDate, // "2021-10-05"
      "endDate": endDate, //2021-10-20
      "currencyType": currency, //USD
      "valueType": valuetype ? "valuebuy" : "valuesale"
    };
    try {
      _dio.options.headers["x-token"] = token;
      Response response =
          await _dio.post(_urlBCV + _trendsEndPoint, data: body);
      print(response.data);
      return TrendsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TrendsModel.withError("Data not found / Connection issue");
    }
  }
}
