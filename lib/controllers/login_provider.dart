import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_buddy/models/request/auth/login_model.dart';
import 'package:language_buddy/services/helpers/auth_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/color_scheme.dart';
import '../views/ui/mainscreen.dart';
import '../views/ui/user/language_details.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool _isFirstTime = true;
  bool get isFirstTime => _isFirstTime;

  set isFirstTime(bool newState) {
    _isFirstTime = newState;
    notifyListeners();
  }

  bool? _entrypoint;
  bool get entrypoint => _entrypoint??false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _isLoggedIn;
  bool get isLoggedIn => _isLoggedIn??false;

  set isLoggedIn(bool newState) {
    _isLoggedIn = newState;
    notifyListeners();
  }


  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    entrypoint = prefs.getBool('entrypoint')?? false;
    isLoggedIn = prefs.getBool('isLoggedIn')?? false;
  }

  final loginFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = loginFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response && isFirstTime) {
        Get.off(() => const LanguageDetails());
      } else if (response && !isFirstTime ) {
        Get.off(() => const MainScreen());
      } else if (!response){
        Get.snackbar("Login Failed", "Please check your credentials",
            colorText: contentColor,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert));
      }
    });
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('access_token');
    _isFirstTime = false;
  }
}