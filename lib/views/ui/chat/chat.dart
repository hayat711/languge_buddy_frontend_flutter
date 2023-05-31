import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';


class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: 'Chat',
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
          )
      ),
    );
  }
}