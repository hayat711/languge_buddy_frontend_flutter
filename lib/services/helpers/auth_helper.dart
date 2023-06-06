import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:language_buddy/models/request/auth/login_model.dart';
import 'package:language_buddy/models/request/auth/signup_model.dart';
import 'package:language_buddy/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/response/auth/login_res_model.dart';
import '../../models/response/auth/signup_res_model.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(model));

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String userId = loginResponseModelFromJson(response.body).id;
      String accessToken = loginResponseModelFromJson(response.body).accessToken;
      String refreshToken = loginResponseModelFromJson(response.body).refreshToken;
      // String avatar = loginResponseModelFromJson(response.body).profile;

      await prefs.setString('userId', userId);
      await prefs.setString('accessToken', accessToken);
      await prefs.setString('refreshToken', refreshToken);
      await prefs.setBool('isLoggedIn', true);


      return true;
    } else {
      return false;
    }

  }

  static Future<bool> signup(SignupModel model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.signupUrl);
    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(model));

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String userId = signupResponseModelFromJson(response.body).id;
      String accessToken = signupResponseModelFromJson(response.body).accessToken;
      String refreshToken = signupResponseModelFromJson(response.body).refreshToken;
      // String avatar = loginResponseModelFromJson(response.body).profile;

      await prefs.setString('userId', userId);
      await prefs.setString('accessToken', accessToken);
      await prefs.setString('refreshToken', refreshToken);
      await prefs.setBool('isLoggedIn', true);

      return true;

    } else {
      return false;
    }
  }
}