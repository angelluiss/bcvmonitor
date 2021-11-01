import 'package:bcvapp/src/models/covid_model.dart';
import 'package:bcvapp/src/models/login_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';
  final String _urlBCV = 'https://bcv-currencies.herokuapp.com/';
  final String _loginEndPoint = 'api/login';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      // ignore: avoid_print
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
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");
      return LoginModel.withError("Data not found / Connection issue");
    }
  }
}
