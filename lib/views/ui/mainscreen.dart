import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/views/common/drawer/drawer_screen.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/width_spacer.dart';
import 'package:language_buddy/views/ui/chat/chat_list.dart';
import 'package:language_buddy/views/ui/user/profile.dart';
import 'package:language_buddy/views/ui/chat/chat.dart';
import 'package:language_buddy/views/ui/explore/explore.dart';
import 'package:language_buddy/views/ui/notification/notification.dart';
import 'package:language_buddy/views/ui/homepage.dart';
import 'package:language_buddy/constants/color_scheme.dart';
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
        return GlassmorphicContainer(
          width: width,
          height: height,
          borderRadius: 0,
          alignment: Alignment.center,
          border: 2,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              const Color.fromARGB(255, 221, 40, 100).withOpacity(0.4),
              const Color.fromARGB(255, 39, 70, 70).withOpacity(0.4),
            ],
            stops: const [0.1, 1]
            ),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              Colors.pinkAccent.withOpacity(0.2),
              Colors.cyanAccent.withOpacity(0.2),
            ],
          ),
          blur: 60,
          child: Stack(

            children: [
                // backgroun image
                Image.asset('assets/images/bg.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

                // backdrop filter
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                
                ZoomDrawer(
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
                menuBackgroundColor: Colors.transparent,
              ),
            ],
          ),
        );
    });
  }
  Widget currentScreen () {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);

    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatList();
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

