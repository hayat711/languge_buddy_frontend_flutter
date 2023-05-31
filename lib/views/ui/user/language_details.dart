import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

import '../../common/custom_textfeild.dart';

class LanguageDetails extends StatefulWidget {
  const LanguageDetails({Key? key}) : super(key: key);

  @override
  State<LanguageDetails> createState() => _LanguageDetailsState();
}

class _LanguageDetailsState extends State<LanguageDetails> {
  final TextEditingController languageName = TextEditingController();
  final TextEditingController languageCode = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController level = TextEditingController();
  final TextEditingController isNative = TextEditingController();

  @override
  void dispose() {
    languageName.dispose();
    languageCode.dispose();
    location.dispose();
    level.dispose();
    isNative.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w, vertical: 60.h
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(text: 'Language Details',
                   style: appstyle(28, contentColor, FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: null,
                    child: const CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      // backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),

                ],
              ),

              const HeightSpacer(size: 20),

            //  TODO FORM
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: languageName,
                      hintText: 'Language Name',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Please enter language name';
                        }
                        return null;
                      },
                    ),

                    const HeightSpacer(size: 20),

                    CustomTextField(
                      controller: languageCode,
                      hintText: 'Language Code',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Please enter language code';
                        }
                        return null;
                      },
                    ),

                    const HeightSpacer(size: 20),

                    CustomTextField(
                      controller: location,
                      hintText: 'Your location',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Please enter your location ';
                        }
                        return null;
                      },
                    ),

                    const HeightSpacer(size: 20),

                    CustomTextField(
                      controller: isNative,
                      hintText: 'Is Native',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Please enter your native language';
                        }
                        return null;
                      },
                    ),

                    const HeightSpacer(size: 20),

                    CustomTextField(
                      controller: level,
                      hintText: 'Level',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Please enter language level';
                        }
                        return null;
                      },
                    ),

                    const HeightSpacer(size: 20),





                  ],
                ),
              )

            ],
          );
        }
      ),
    );
  }
}