import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/controllers/signup_provider.dart';
import 'package:language_buddy/models/request/auth/signup_model.dart';
import 'package:language_buddy/views/common/custom_btn.dart';
import 'package:language_buddy/views/common/custom_textfeild.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/ui/auth/login.dart';
import 'package:logger/logger.dart';
import '../../../controllers/login_provider.dart';
import '../../common/custom_appbar.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController displayName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  var logger = Logger();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    displayName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);

    return Consumer<SignUpNotifier>(
      builder: (context, signUpNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                text: 'Register',
                child: GestureDetector(
                  child: const Icon(CupertinoIcons.arrow_left),
                  onTap: () {
                    Get.back();
                  },
                ),

              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ListView(
                padding: EdgeInsets.zero,
                children:  [
                  const HeightSpacer(size: 10),
                  const ReusableText(text: "Hello 👋 Welcome!", style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
                  ),
                  ),
                  const ReusableText(text: "Fill the details to register!", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
                  ),
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: firstName,
                    keyboardType: TextInputType.text,
                    hintText: 'First Name',
                    validator: (firstName) {
                      if (firstName!.isEmpty) {
                        return 'First Name cannot be empty';
                      } else {
                        return null;
                      }
                    },

                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: lastName,
                    keyboardType: TextInputType.text,
                    hintText: 'Last Name',
                    validator: (lastName) {
                      if (lastName!.isEmpty) {
                        return 'Last Name cannot be empty';
                      } else {
                        return null;
                      }
                    },

                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: displayName,
                    keyboardType: TextInputType.text,
                    hintText: 'Username',
                    validator: (displayName) {
                      if (displayName!.isEmpty) {
                        return 'User Name cannot be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!email.contains('@')) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: signUpNotifier.obscureText,
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (signUpNotifier.passwordValidator(password ?? '')) {
                        return 'Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number and one special character';
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signUpNotifier.obscureText = !signUpNotifier.obscureText;
                      },
                      child:  Icon(
                          signUpNotifier.obscureText ?
                          Icons.visibility : Icons.visibility_off, color: contentColor.withOpacity(0.8)),
                    ),
                  ),

                  const HeightSpacer(size: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => const Login());
                              },
                              child: ReusableText(text: 'Already hava account?', style: appstyle(14, contentColor, FontWeight.w500, ),
                              )
                          )
                      ),
                    ],
                  ),
                  const HeightSpacer(size: 20),
                  CustomButton(
                    onTap: (){
                      logger.d('on tap pressed in register');
                      // loginNotifier.isFirstTime = !loginNotifier.isFirstTime;
                      if (
                      // signUpNotifier.validateAndSave()
                      true
                      ) {
                        logger.i('i am called');
                        SignupModel model = SignupModel(
                            firstName: firstName.text ,
                            lastName: lastName.text ,
                            displayName: displayName.text ,
                            email: email.text,
                            password: password.text ,
                        );
                        signUpNotifier.userSignUp(model);
                        logger.i('sign up model is $firstName');
                      } else {
                        Get.snackbar("Register Failed",
                        "Please fill all the fields correctly & try again",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                          icon: const Icon(Icons.error_outline_sharp, color: Colors.white,),
                        );
                      }
                    },
                    text: 'Register',

                  )
                ],
              ),
            )
        );
      },
    );
  }
}