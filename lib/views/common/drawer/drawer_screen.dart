import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/width_spacer.dart';
import 'package:language_buddy/views/ui/mainscreen.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;

  const DrawerScreen({Key? key, required this.indexSetter}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
        builder: (context, zoomNotifier, child) {
          return GestureDetector(
            onDoubleTap: () {
              ZoomDrawer.of(context)!.toggle();
            },
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerItem(
                    context,
                    AntDesign.home,
                    'Home', 0,
                    zoomNotifier.currentIndex == 0
                      ? Colors.white : Colors.white.withOpacity(0.7),
                  ),
                  drawerItem(
                    context,
                    Ionicons.chatbubble_outline,
                    'Chat',
                    1,
                    zoomNotifier.currentIndex == 1
                        ? Colors.white : Colors.white.withOpacity(0.7),
                  ),
                  drawerItem(
                    context,
                    AntDesign.search1,
                    'Explore',
                    2,
                    zoomNotifier.currentIndex == 2
                        ? Colors.white : Colors.white.withOpacity(0.7),
                  ),
                  drawerItem(
                    context,
                    Ionicons.notifications_circle_outline,
                    'Notifications',
                    3,
                    zoomNotifier.currentIndex == 3
                        ? Colors.white : Colors.white.withOpacity(0.7),


                  ),
                  drawerItem(
                    context,
                    FontAwesome5Regular.user_circle,
                    'Profile',
                    4,
                    zoomNotifier.currentIndex == 4
                        ? Colors.white : Colors.white.withOpacity(0.7),


                  )
                ],
              ),

            ),
          );
        }
    );
  }

  Widget drawerItem(BuildContext context, IconData icon, String text, int index, Color color) {
    return GestureDetector(
        onTap: () {
          print('onTap triggered with index ---> $index');
          widget.indexSetter(index);
        },
        child: Container(
          margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 30.sp,
              ),
              const WidthSpacer(width: 12),
              ReusableText(text: text, style: appstyle(13, color, FontWeight.bold)),
              // SizedBox(
              //   width: 20.w,
              // ),

            ],
          ),
        )
    );
  }
}
