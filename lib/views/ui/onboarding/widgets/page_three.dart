import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_buddy/views/common/CustomOutlineButton.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/reusable_text.dart';
import 'package:language_buddy/views/ui/auth/login.dart';
import 'package:language_buddy/views/ui/auth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:language_buddy/constants/color_scheme.dart';

import '../../../common/app_style.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              Image.asset('assets/images/page_three.jpg'),
              const HeightSpacer(size: 10),
               ReusableText(text: "Welcome to Language Buddy!",
                    style: appstyle(24, contentColor, FontWeight.bold),
              ),
              const HeightSpacer(size: 10),

              const HeightSpacer(size: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomOutlineButton(
                      onTap: () async {
                          final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            await prefs.setBool('entrypoint', true);
                        Get.to(() => const Login());
                      },
                      text: "Login",
                      width: 140,
                      height: 50,
                      color: contentColor,
                      color2: secondaryColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Register());
                      },
                      child: Container(
                        width: 140,
                        height: 50,
                        color: accentColor,
                        child:  Center(
                          child: ReusableText(text: "Sign Up",
                          style: appstyle(19, secondaryColor, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(size: 30),
               ReusableText(text: "Continue as Guest",
                style: appstyle(18, secondaryColor, FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
