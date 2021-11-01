import 'package:shared_preferences/shared_preferences.dart';

class BCVPreferences {
  static const tokenHash = "tokenBCV";

  static setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenHash, value);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenHash) ?? '';
  }
}
