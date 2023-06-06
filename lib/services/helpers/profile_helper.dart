import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:language_buddy/models/request/auth/add_language_model.dart';
import 'package:language_buddy/services/config.dart';
import 'package:logger/logger.dart';

class LanguageHelper {
  static var client = http.Client();
  final Logger logger = Logger();

  static Future<bool> saveLanguageDetails(AddLanguageModel languageModel) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.addLangauage);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(languageModel),
    );

    if (response.statusCode == 200) {
      // Language details saved successfully
      print('languge detials saved successully!');
      return true;
    } else {
      // Failed to save language details
      print('Falied to save language details');
      return false;
    }
  }
}
