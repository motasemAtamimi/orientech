import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref();
  // Save login status
  Future<void> saveLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Retrieve login status
  Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Remove login status
  Future<void>  clearLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
  }

  static saveString(String key,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key,value);
  }
  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(key) ??"";
  }

  static saveInt(String key,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }


  static saveBool(String key,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key,value);
  }
  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

}
