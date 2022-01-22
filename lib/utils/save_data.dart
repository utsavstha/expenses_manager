import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static String token = "token";
  static void saveData(String tokenData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SaveData.token, tokenData);
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SaveData.token) ?? "";
  }
}
