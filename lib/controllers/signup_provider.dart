import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_buddy/models/request/auth/login_model.dart';
import 'package:language_buddy/models/request/auth/signup_model.dart';
import 'package:language_buddy/services/helpers/auth_helper.dart';
import 'package:language_buddy/views/ui/mainscreen.dart';
import 'package:logger/logger.dart';

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


  var logger = Logger();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  bool passwordValidator(String password) {
    if (password.isEmpty) {
      return false;
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  bool validateAndSave() {
    logger.d('validateAndSave called');
    final form = signupFormKey.currentState;
    logger.i('form --> $form');
    if (form != null ){
      if (form.validate()) {
        form.save();
        return true;
      }
    }

    return false;
  }

  userSignUp(SignupModel model) {
    logger.d('firstName --> ${model.firstName}');
    logger.d('lastName --> ${model.lastName}');
    logger.i('email --> ${model.email}');
    logger.wtf('password --> ${model.password}');
    logger.i('username --> ${model.displayName}');

    AuthHelper.signup(model).then((response) {
      if (response) {
        logger.d('response --> $response');
        logger.i('Successfully registered');
        Get.snackbar("Register Success", "Welcome to Language Buddy",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.check_circle_outline_outlined, color: accentColor,)
        );
        Get.off(() => const MainScreen());  //TODO check to go to home page or language details
      } else if (!response ) {
        Get.snackbar("Register Failed", "Please try again",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error_outline_outlined)
        );
      }
    });
  }

}