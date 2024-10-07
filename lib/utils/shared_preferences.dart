import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // Singleton
  static final SharedPreferenceHelper shared =
      SharedPreferenceHelper._privateConstructor();

  SharedPreferenceHelper._privateConstructor();

  final String _accessToken = "accessToken";
  final String _getName = "getName";



  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessToken);
  }

  Future<bool> setAccessToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_accessToken, value);
  }


  Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_getName);
  }

  Future<bool> setName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_getName, value);
  }
Future<void> clear() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
}
