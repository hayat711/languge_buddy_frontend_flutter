import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/views/common/drawer/drawer_screen.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/width_spacer.dart';
import 'package:language_buddy/views/ui/user/profile.dart';
import 'package:language_buddy/views/ui/chat/chat.dart';
import 'package:language_buddy/views/ui/explore/explore.dart';
import 'package:language_buddy/views/ui/notification/notification.dart';
import 'package:language_buddy/views/ui/homepage.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:language_buddy/views/ui/explore/search-widget.dart';
import 'package:provider/provider.dart';
import '../../constants/color_scheme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>
      (builder: (context, zoomNotifier, child) {
        return ZoomDrawer(
          menuScreen: DrawerScreen(
              indexSetter: (index) {
                zoomNotifier.currentIndex = index;
              }
          ),
          mainScreen: currentScreen(),
          borderRadius: 30.0,
          showShadow: true,
          angle: 0.0,
          slideWidth: 250,
          drawerShadowsBackgroundColor: backgroundColor,
          menuBackgroundColor: Colors.orangeAccent,
        );
    });
  }
  Widget currentScreen () {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);

    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const Chat();
      case 2:
        return const Explore();
      case 3:
       return const HomePage();
      case 4:
        return const Profile();
      default:
        return const HomePage();
    }
  }
}

