import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:language_buddy/constants/app_constants.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/width_spacer.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key,  this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width:width*0.84,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Feather.search, color: accentColor,size: 20),
                      const WidthSpacer(width: 20),
                      ReusableText(text: 'Search for a language buddy',
                      style:appstyle(18, accentColor, FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              Icon(FontAwesome.sliders, color: accentColor, size: 20.h),
            ],
          ),
          const HeightSpacer(size: 10),
          Divider(
            color: Colors.grey,
            thickness: 0.5,
            endIndent: 40.w,
          )
        ],
      )
    );
  }
}