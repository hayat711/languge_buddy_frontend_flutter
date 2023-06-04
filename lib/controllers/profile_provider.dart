

import 'package:flutter/material.dart';
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
}