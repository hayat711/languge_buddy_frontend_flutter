import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/width_spacer.dart';
import '../../common/custom_appbar.dart';
import '../../common/drawer/drawer_widget.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: 'Profile',
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
          )
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: height * 0.12,
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child:CachedNetworkImage(
                          imageUrl: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiomK9_Dlm_1j-Xh9tYILoG1nTVbXlRLukTeKurzF6390-P22SasG_NIChL89PMkpmX3TxQnQIkFT8CJaQ-DV7MbBWrFTsFBssj9K69bxBV7fQeT7TAXiHnYxVIXYcepyV1JRkOYlHk41JDdhm89r5joKtO9J8ATiXmIIVekHLh1pBFRpgA42XDcrFY/s546/%E0%A6%95%E0%A6%BF%E0%A6%89%E0%A6%9F%20%E0%A6%AE%E0%A7%87%E0%A6%AF%E0%A6%BC%E0%A7%87%E0%A6%A6%E0%A7%87%E0%A6%B0%20%E0%A6%AA%E0%A7%8D%E0%A6%B0%E0%A7%8B%E0%A6%AB%E0%A6%BE%E0%A6%87%E0%A6%B2%20%E0%A6%AA%E0%A6%BF%E0%A6%95%20-%20%E0%A6%AE%E0%A7%87%E0%A6%AF%E0%A6%BC%E0%A7%87%E0%A6%A6%E0%A7%87%E0%A6%B0%20%E0%A6%AA%E0%A6%BF%E0%A6%95%E0%A6%9A%E0%A6%BE%E0%A6%B0%20%E0%A7%A8%E0%A7%A6%E0%A7%A8%E0%A7%A9%20-%20%E0%A6%AE%E0%A7%87%E0%A6%AF%E0%A6%BC%E0%A7%87%E0%A6%A6%E0%A7%87%E0%A6%B0%20%E0%A6%AB%E0%A6%9F%E0%A7%8B%20%E0%A6%A1%E0%A6%BF%E0%A6%9C%E0%A6%BE%E0%A6%87%E0%A6%A8%20-%20meye%20pic%20-%20NeotericIT.com%20(3).jpg',
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
                      ReusableText(text: 'John Doe', style: appstyle( 20, Colors.black, FontWeight.bold)),
                      Row(
                        children:  [
                          const Icon(MaterialIcons.location_pin,
                          color: Colors.grey,),
                          const WidthSpacer(width: 5),

                          ReusableText(text: 'Malaga, Spain',
                              style: appstyle(16, Colors.black38, FontWeight.w500),
                          ),


                        ],
                      )
                    ]
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: const Icon(Feather.edit, size: 18),
                  )
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
                      Container(
                        margin: EdgeInsets.only(left: 12.w),
                        width: 60.w,
                        height: 70.h,
                        color: Colors.white60,
                        child: const Icon(FontAwesome5Regular.file_pdf, color: Colors.pink,size: 40, ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(text: 'Know', style: appstyle( 18, Colors.black, FontWeight.w500)),
                          ReusableText(text: 'Want to learn', style: appstyle( 16, Colors.black, FontWeight.w500)),

                        ],
                      ),
                      const WidthSpacer(width: 2),
                    ],
                  ),
                ),

                Positioned(
                  top: 2.h,
                  right: 5.w,
                  child: GestureDetector(
                    onTap: (){},
                    child: ReusableText(
                      text: 'Edit',
                      style: appstyle( 16, Colors.green, FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),

            const HeightSpacer(size: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: width,
              height: height * 0.06,
              color: Colors.white60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(text: 'Interests: ', style: appstyle( 18, Colors.black, FontWeight.w500)),
              ),
            ),

            const HeightSpacer(size: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: width,
              height: height * 0.06,
              color: Colors.white60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/usa.svg', width: 20, height: 20,),
                    const WidthSpacer(width: 15),
                    ReusableText(text: 'Bio ...  ', style: appstyle( 18, Colors.black, FontWeight.w500)),
                  ],
                ),
              ),
            ),

            const HeightSpacer(size: 20),

            Container(
              //TODO adjust the user profile, bio, interests, languages and level
              color: Colors.white60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(8.h),
                    child: ReusableText(text: 'Languages', style: appstyle( 18, Colors.black, FontWeight.w500)),
                  ),
                  const HeightSpacer(size: 3),

                  SizedBox(
                    height: height * 0.5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 8.h),
                      child: ListView.builder(
                        itemCount: skills.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final skill = skills[index]; // map over the skills list
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              width: width,
                              height: height * 0.06,
                              color: Colors.white60,
                              child: ReusableText(
                                text: skill,
                                style: appstyle( 18, Colors.black, FontWeight.w500),
                              ),
                            ),
                          );
                        }
                      )
                    )
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}