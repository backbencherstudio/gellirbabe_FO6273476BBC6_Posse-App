import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceData {

 static Future<void> setToken(String? token) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "$token" );
  }
 static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

 static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
  Future<void> subscriptionSet(bool? value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('subscription', value??false );
  }
   static Future<bool?> subscriptionGet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('subscription');
  }

 static Future<void> removeSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('subscription');
  }
  static   Future<void> firstTimeSet(bool? value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('first', value??false );
  }
   static Future<bool?> firstTimeGet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first');
  }

 static Future<void> firstTimeRemove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('first');
  }
    static   Future<void> isLoggedInSet(bool? value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', value??false );
  }
   static Future<bool?> isLoggedInGet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn');
  }

 static Future<void> isLoggedInRemove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');
  }



 static Future<void> setPosseId(String? posseId) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('PosseId', "$posseId" );
  }
 static Future<String?> getPosseId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('PosseId');
  }

 static Future<void> removePosseId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('PosseId');
  }



}