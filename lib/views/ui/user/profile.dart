import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/width_spacer.dart';
import '../../../constants/user_lang.dart';
import '../../common/custom_appbar.dart';
import '../../common/drawer/drawer_widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(
          text: 'Profile',
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: double.infinity,
              height: 0.12.sh,
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          'assets/images/avatar3.jpg',
                          width: 80.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const WidthSpacer(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: 'Gabriel Garcia',
                        style: appstyle(20, Colors.black, FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(
                            MaterialIcons.location_pin,
                            color: Colors.grey,
                          ),
                          const WidthSpacer(width: 5),
                          ReusableText(
                            text: 'Malaga, Spain',
                            style: appstyle(
                                16, Colors.black38, FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Feather.edit, size: 18),
                  ),
                ],
              ),
            ),
            const HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.12,
                  color: Colors.white60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                              text: 'Know',
                              style: appstyle(
                                  18, Colors.black, FontWeight.w500)),
                          ReusableText(
                              text: 'Want to learn',
                              style: appstyle(
                                  16, Colors.black, FontWeight.w500)),
                          const HeightSpacer(size: 10),
                          ReusableText(
                            text: 'Want to learn',
                            style: appstyle(
                                16, Colors.black, FontWeight.w500),
                          ),
                          ReusableText(
                            text: 'Persian, Arabic, Korean',
                            style: appstyle(
                                14, Colors.grey, FontWeight.w500),
                          ),
                        ],
                      ),
                      const WidthSpacer(width: 2),
                      Positioned(
                        top: 2.h,
                        right: 5.w,
                        child: GestureDetector(
                          onTap: () {},
                          child: ReusableText(
                            text: 'Edit',
                            style:
                            appstyle(16, Colors.green, FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const HeightSpacer(size: 20),
            Container(
              width: double.infinity,
              height: 0.06.sh,
              color: Colors.white60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                  text: 'Interests: ',
                  style: appstyle(18, Colors.black, FontWeight.bold),
                ),
              ),
            ),
            const HeightSpacer(size: 20),
            Container(
              width: double.infinity,
              height: 0.06.sh,
              color: Colors.white60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/usa.svg',
                        width: 20, height: 20),
                    const WidthSpacer(width: 15),
                    ReusableText(
                      text: 'Bio ...  ',
                      style: appstyle(18, Colors.black, FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const HeightSpacer(size: 20),
            Container(
              color: Colors.white60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: ReusableText(
                      text: 'Languages',
                      style: appstyle(18, Colors.black, FontWeight.bold),
                    ),
                  ),
                  const HeightSpacer(size: 3),
                  SizedBox(
                    height: 0.5.sh,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 8.h),
                      child: ListView.builder(
                        itemCount: popularLanguages.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final language = popularLanguages[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                              width: double.infinity,
                              height: 0.06.sh,
                              color: Colors.white60,
                              child: ReusableText(
                                text: language,
                                style: appstyle(
                                    18, Colors.black, FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
