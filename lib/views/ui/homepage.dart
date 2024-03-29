import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/custom_btn.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/heading_widget.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/ui/explore/search-widget.dart';
import 'package:language_buddy/views/ui/explore/people_horizontal_tile.dart';
import 'package:language_buddy/views/ui/explore/search_buddy.dart';
import 'package:language_buddy/views/ui/user/language_buddy_profile.dart';
import 'package:language_buddy/views/ui/user/language_details.dart';
import 'package:logger/logger.dart';

import '../../constants/mockUsers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 10),
                Text(
                  "Search",
                  style: appstyle(24, primaryColor, FontWeight.bold),
                ),
                const HeightSpacer(size: 20),

                //TODO customize the search body widget
                SearchWidget(
                  onTap: () {
                    Get.to(() => const SearchBuddy());
                  },
                ),

                //TODO a screen sized slider to show people
                const HeightSpacer(size: 20),
                Container(
                    child: HeadingWidget(text: 'People', onTap: () {}, )),


                //TODO a screen sized slider to show people
                const HeightSpacer(size: 10),
                Container(
                  width: double.infinity,
                  height: height * 0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mockUsers.length,
                    itemBuilder: (context, index) {
                      final user = mockUsers[index];
                      final userAvatar = user['image'];
                      final userName = user['displayName'];
                      final userBio = user['bio'] ?? 'No bio available';
                      final userLang = user['language'] ?? 'No language specified';
                      final age = user['age'] ?? 21;
                      final userLocation = user['location'] ?? 'No location specified';
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: PeopleHorizontalTile(
                          onTap: () {
                            Get.to(() =>  LanguageBuddyProfile(
                              userAvatar: userAvatar,
                              userName: userName,
                              userBio: userBio,
                              userLang: userLang,
                              age: age,
                              userLocation: userLocation,
                              index: index,
                            ));
                          },
                          userAvatar: userAvatar,
                          userName: userName,
                          userBio: userBio,
                          userLang: userLang,
                          index: index,

                        ),
                      );
                    },
                  ),
                ),
                const HeightSpacer(size: 20),
                //TODO some text to show the recent or new users
                 Positioned(
                   bottom: 0,
                   child: GestureDetector(
                     onTap: () {
                       Get.to(() => const LanguageDetails());
                     },
                       child: const CustomButton(text: 'Setup your profile and get Started', onTap: null,),
                   ),
                 )
                ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
