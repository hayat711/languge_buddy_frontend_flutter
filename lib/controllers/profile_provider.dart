

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/models/request/auth/add_language_model.dart';
import 'package:language_buddy/services/helpers/profile_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNotifier extends ChangeNotifier {

  bool _isNative = true;
  bool get isNative => _isNative;

  set isNative(bool newValue) {
    _isNative = newValue;
    notifyListeners();
  }

  String _level = 'Intermediate';
  String get level => _level;
  
  set level(String newLevel) {
    _level = newLevel;
    notifyListeners();
  }

  String _location = 'South Korea';
  String get location => _location;

  set location(String newLocation){
    _location = newLocation;
    notifyListeners();
  }


  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNative = prefs.getBool('isNative')??true;
    _level = prefs.getString('level')??'Intermediate';
    notifyListeners();
  }

  setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isNative', _isNative);
    prefs.setString('level', _level);
    notifyListeners();
  }

  void saveLanguageDetails(AddLanguageModel model) {
    LanguageHelper.saveLanguageDetails(model).then((response) {
      if (response) {
        Get.snackbar('Success', 'Language Details saved successfully! ✅',
          colorText: contentColor,
          backgroundColor: Colors.green[400],
          icon: const Icon(Icons.check_circle_outline),
        );
        Get.toNamed('/home');
      } else {
        Get.snackbar('Error', 'Failed to save language details',
          colorText: contentColor,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),

        );
      }
    });
  }

}