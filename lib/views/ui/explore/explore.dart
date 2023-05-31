import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';
import 'package:language_buddy/views/common/height_spacer.dart';

class Explore extends StatelessWidget{
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: 'Explore',
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
          )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 10),
                Text("Search \nFind & Learn",
                  style: appstyle(40, Colors.black, FontWeight.bold),
                ),
                const HeightSpacer(size: 40),

                //TODO customize the search body widget
                // const SearchWidget(
                //   onTap: null,
                // )

                //TODO a screen sized slider to show people
              ],
            ),
          ),
        ),
      ),
    );
  }
}