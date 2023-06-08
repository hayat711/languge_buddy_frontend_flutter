import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:language_buddy/models/request/auth/login_model.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/custom_btn.dart';
import 'package:language_buddy/views/common/custom_textfeild.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/ui/auth/register.dart';
import 'package:language_buddy/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_scheme.dart';
import '../../../controllers/login_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        loginNotifier.getPrefs();
        return Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                text: 'Login',
                child: loginNotifier.entrypoint && !loginNotifier.isLoggedIn? GestureDetector(
                  child: const Icon(CupertinoIcons.arrow_left),
                  onTap: () {
                    Get.back();
                  },
                ): const SizedBox.shrink(),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                padding: EdgeInsets.zero,
                children:  [
                  const HeightSpacer(size: 50),
                   ReusableText(text: "Welcome Back!",
                       style: appstyle(28, contentColor, FontWeight.bold)
                  ),
                  const ReusableText(text: "Fill the details to login to your account!", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: contentColor,
                  ),
                  ),
                  const HeightSpacer(size: 50),
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
                    obscureText: loginNotifier.obscureText,
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 7) {
                        return 'Password cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifier.obscureText = !loginNotifier.obscureText;
                      },
                      child:  Icon(
                          loginNotifier.obscureText ?
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
                                Get.to(() => const Register());
                              },
                              child: ReusableText(text: 'Register', style: appstyle(14, contentColor, FontWeight.w500, ),
                              )
                          )
                      ),
                    ],
                  ),
                  const HeightSpacer(size: 50),
                  CustomButton(
                    onTap: (){
                      if (loginNotifier.validateAndSave()){
                        LoginModel model = LoginModel(
                          email: email.text,
                          password: password.text,
                        );

                        loginNotifier.userLogin(model);
                      } else {
                        Get.to(() => const MainScreen()); //TODO: Remove this line after testing
                        Get.snackbar("Login Failed", "Please check your credentials",
                            colorText: contentColor,
                            backgroundColor: Colors.red,
                            icon: const Icon(Icons.add_alert));
                      }
                    },
                    text: 'Login',

                  )
                ],
              ),
            )
        );
      },
    );
  }
}