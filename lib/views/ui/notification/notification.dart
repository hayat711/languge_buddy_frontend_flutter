import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/views/common/custom_appbar.dart';
import 'package:language_buddy/views/common/drawer/drawer_widget.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: Row(
              children: const [
                Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(), // Add a spacer to push the DrawerWidget to the right
                DrawerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
