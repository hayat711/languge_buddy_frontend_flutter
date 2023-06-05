import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/controllers/profile_provider.dart';
import 'package:language_buddy/models/request/auth/add_language_model.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/custom_btn.dart';
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
  CountryCode countryCode = CountryCode.fromCountryCode('KR');


  @override
  void dispose() {
    languageName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profileNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
                  child: CustomAppBar(
                    text: 'Details',
                    child:  GestureDetector(
                      child: const Icon(CupertinoIcons.arrow_left),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
          body: Consumer<LoginNotifier>(
            builder: (context, loginNotifier, child) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w, vertical: 10.h
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
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                      ),
              
                    ],
                  ),
              
                  const HeightSpacer(size: 20),
              
                  Form(
                    child: Column(
                      children: [
                        const HeightSpacer(size: 10),

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
                      
                        Column(
                          children: [
                            Text(
                              'Is your native language?',
                              style: appstyle(18, contentColor, FontWeight.w500),
                            ),
                            Column(
                              children:<Widget> [
                                ListTile(
                                  title: const Text('Yes'),
                                  leading: Radio(
                                    value: true,
                                    groupValue: loginNotifier.isNative,
                                    onChanged: (value) {
                                      loginNotifier.isNative = value as bool;
                                    },
                                  ),
                                
                                ),
                                ListTile(
                                  title: const Text('No'),
                                  leading: Radio(
                                    value: false,
                                    groupValue: loginNotifier.isNative,
                                    onChanged: (value) {
                                      loginNotifier.isNative = value as bool;
                                    },
                                  ),
                                )
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
                              items: <String>['Beginner', 'Intermediate', 'Advanced', 'Expert'].map((String value) {
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
                              CountryCodePicker(
                              onChanged: (CountryCode? newCountryCode) {
                                if(newCountryCode != null) {
                                  countryCode = newCountryCode;
                                  profileNotifier.location = countryCode.name ?? '';
                                }
                              },
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

                        CustomButton(
                          onTap: () {
                            final languageModel =  AddLanguageModel(
                              name: languageName.text,
                              isNative: profileNotifier.isNative,
                              level: profileNotifier.level.toString(),
                              location: profileNotifier.location.toString(),
                            ); 
                            print('save button pressed --> ');
                            profileNotifier.saveLanguageDetails(languageModel);
                          }, 
                          text: 'Save')
              
                      ],
                    ),
                  )
              
                ],
              );
            }
          ),
        );
  
      });
    
  }
}