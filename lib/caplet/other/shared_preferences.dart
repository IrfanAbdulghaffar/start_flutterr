import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._privateConstructor();
  static final SharedPreference instance = SharedPreference._privateConstructor();
  static late SharedPreferences _preferences;
  Future init() async => _preferences = await SharedPreferences.getInstance();

  String? getData(String text) => _preferences.getString(text);
  void setData(String key,String text) => _preferences.setString(key, text);
  clear() => _preferences.clear();
}