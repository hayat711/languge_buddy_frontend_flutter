import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:language_buddy/constants/app_constants.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/width_spacer.dart';

class PeopleHorizontalTile extends StatelessWidget {
  const PeopleHorizontalTile({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.7,
          height: height * 0.5,
          color: secondaryBackgroundColor.withOpacity(0.2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    const WidthSpacer(width: 15),
                    ReusableText(
                      text: 'User Name',
                      style: appstyle(18, contentColor, FontWeight.w600),
                    ),
                  ],
                ),
                const HeightSpacer(size: 15),
                //TODO the user bio
                ReusableText(
                  text: 'Language exchange & cultural exchange',
                  style: appstyle(16, contentColor, FontWeight.w500),
                ),
                ReusableText(
                  text:
                  'I am a native English speaker from the UK. I am looking for a language exchange partner to practice my Spanish with. I am a native English speaker from the UK. I am looking for a language exchange partner to practice my Spanish with.',
                  style: appstyle(16, contentColor, FontWeight.w500),
                ),
                const HeightSpacer(size: 20),
                //TODO the user language info
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ReusableText(
                            text: 'Native: English',
                            style: appstyle(16, Colors.black, FontWeight.w500),
                          ),
                          ReusableText(
                            text: 'Learning: Spanish',
                            style: appstyle(16, Colors.black38, FontWeight.w500),
                          ),
                          ReusableText(
                            text: 'Level: B2',
                            style: appstyle(16, Colors.black38, FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white60,
                      child: Icon(Ionicons.chevron_forward),
                    )
                  ],
                ),*/

                //TODO the user info
              ],
            ),
          ),
        ),
      ),
    );
  }
}
