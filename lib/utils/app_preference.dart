
import 'package:jain_app/utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  AppPreference._privateConstructor();

  static final AppPreference instance = AppPreference._privateConstructor();

  final String _fcmToken = "fcm-token";

  Future<void> saveFCMToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_fcmToken, token);
    return;
  }

  Future<String> getFCMToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_fcmToken) ?? "";
  }

  Future<String> getLanguageData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(Pref.languageData) ?? "";
  }

  Future<void> saveLanguageId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Pref.languageId, id);
  }

  Future<String> getLanguageId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(Pref.languageId) ?? "1";
  }

  Future savePref(String data, String prefName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(prefName, data);
  }

  Future<String> getPref(String prefName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(prefName) ?? "";
    return languageCode;
  }
}
