import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_buddy/models/request/auth/login_model.dart';
import 'package:language_buddy/models/request/auth/signup_model.dart';
import 'package:language_buddy/services/helpers/auth_helper.dart';
import 'package:language_buddy/views/ui/mainscreen.dart';

import '../constants/color_scheme.dart';
import '../views/ui/user/language_details.dart';

class SignUpNotifier extends ChangeNotifier {
  // trigger the hide and unhide the password
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  //  triggred when teh login button is clicked to show the loading widget
  bool _processing = false;
  bool get processing => _processing;

  set processing(bool newState) {
    _processing = newState;
    notifyListeners();
  }

  // triggered when the first time when user login to prompted to the update profile page
  bool _firstTime = true;
  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }




  final signupFormKey = GlobalKey<FormState>();

  bool passwordValidator(String password) {
    if (password.isEmpty) {
      return false;
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  userSignUp(SignupModel model) {
    print('firstName --> ${model.firstName}');
    print('lastName --> ${model.lastName}');
    print('email --> ${model.email}');
    print('password --> ${model.password}');
    print('username --> ${model.displayName}');


  }

}