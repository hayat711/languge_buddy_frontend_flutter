import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

import '../../../views/common/custom_textfeild.dart';

class LanguageDetails extends StatefulWidget {
  const LanguageDetails({Key? key}) : super(key: key);

  @override
  State<LanguageDetails> createState() => _LanguageDetailsState();
}

class _LanguageDetailsState extends State<LanguageDetails> {
  final TextEditingController languageName = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController level = TextEditingController();
  final TextEditingController isNative = TextEditingController();

  @override
  void dispose() {
    languageName.dispose();
    location.dispose();
    level.dispose();
    isNative.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return GlassmorphicContainer(
            width: width,
            height: height,
            borderRadius: 10,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 221, 87, 87).withOpacity(0.1),
                Color.fromARGB(255, 192, 45, 199).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 217, 64, 117).withOpacity(0.5),
                Color.fromARGB(255, 72, 217, 214).withOpacity(0.5),
              ],
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Language Details',
                      style: appstyle(28, contentColor, FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const CircleAvatar(
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
                          if (value!.isEmpty) {
                            return 'Please enter language name';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 20),
                      Column(
                        children: [
                          Text(
                            'Is your native language?',
                            style: appstyle(18, contentColor, FontWeight.w500),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<bool>(
                                  title: const Text('Yes'),
                                  value: true,
                                  groupValue: loginNotifier.isNative,
                                  onChanged: (value) {
                                    loginNotifier.isNative = value!;
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: loginNotifier.isNative,
                                  onChanged: (value) {
                                    loginNotifier.isNative = value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const HeightSpacer(size: 20),
                      Column(
                        children: [
                          Text(
                            'Select your language level',
                            style: appstyle(18, contentColor, FontWeight.w500),
                          ),
                          DropdownButton<String>(
                            value: loginNotifier.level,
                            onChanged: (newValue) {
                              loginNotifier.level = newValue!;
                            },
                            items: <String>[
                              'Beginner',
                              'Intermediate',
                              'Advanced',
                              'Expert'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const HeightSpacer(size: 20),
                      Column(
                        children: [
                          Text(
                            'Select your location',
                            style: appstyle(18, contentColor, FontWeight.w500),
                          ),
                          const CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'KR',
                            favorite: ['+82', 'KR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ],
                      ),
                      const HeightSpacer(size: 20),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
