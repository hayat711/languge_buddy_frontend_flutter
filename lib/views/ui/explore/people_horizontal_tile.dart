import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:language_buddy/constants/app_constants.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/width_spacer.dart';
import 'package:logger/logger.dart';

class PeopleHorizontalTile extends StatelessWidget {
  static int avatarNumber = 1;
  const PeopleHorizontalTile({
    Key? key,
    this.onTap,
    required this.userName,
    required this.userBio,
    required this.userLang,
    this.userAvatar, required this.index,
  }) : super(key: key);


  final void Function()? onTap;
  final String? userAvatar;
  final String userName;
  final String userBio;
  final String userLang;
  final int index;

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.i('userAvatar: $userAvatar');
    final currentAvatarNumber = avatarNumber++;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: GestureDetector(

        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: SizedBox(
            width: width * 0.7,
            height: height * 0.5,
            child: Stack(
              children: [
                // Image
                Image.asset('assets/images/avatar${index ?? 1}.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    // Handle image loading errors here
                    return Container();
                  },
                ),
                // Blurred background
                Positioned.fill(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),

                // Content
                // Positioned(
                //   left: 10.w,
                //   bottom: 10.h,
                //   right: 10.w,
                //   child: ConstrainedBox(
                //     constraints: const BoxConstraints(
                //       maxHeight: 95,
                //     ),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(10.0),
                //       child: BackdropFilter(
                //         filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white.withOpacity(0.4),
                //           ),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Expanded(
                //                 child: Container(
                //                   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                //                   child: SingleChildScrollView(
                //                     child: Row(
                //                       children: [
                //                         const CircleAvatar(
                //                           backgroundImage: AssetImage('assets/images/avatar1.jpg'),
                //                         ),
                //                         const WidthSpacer(width: 15),
                //                         Expanded(
                //                           child: Column(
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                             children: [
                //                               Row(
                //                                 children: [
                //                                   ReusableText(
                //                                     text: userName,
                //                                     style: appstyle(18, contentColor, FontWeight.w600),
                //                                   ),
                //                                 ],
                //                               ),
                //                               const HeightSpacer(size: 15),
                //                               ReusableText(
                //                                 text: userBio,
                //                                 style: appstyle(16, contentColor, FontWeight.w500),
                //                               ),
                //                               ReusableText(
                //                                 text: userLang,
                //                                 style: appstyle(16, contentColor, FontWeight.w500),
                //                               ),
                //                               const HeightSpacer(size: 20),
                //                             ],
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
