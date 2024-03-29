import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/controllers/chat_provider.dart';
import 'package:language_buddy/controllers/profile_provider.dart';
import 'package:language_buddy/views/ui/auth/login.dart';
import 'package:language_buddy/views/ui/homepage.dart';
import 'package:language_buddy/views/ui/mainscreen.dart';
import 'package:language_buddy/views/ui/onboarding/on_boarding.dart';
import 'package:language_buddy/views/ui/onboarding/widgets/onboard_notifier.dart';
import 'package:provider/provider.dart';
import 'package:language_buddy/controllers/exports.dart';
import 'package:language_buddy/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/common/exports.dart';


Widget defaultHome = const OnBoarding();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final entrypoint = prefs.getBool('entrypoint')?? false;
  final isLoggedIn = prefs.getBool('isLoggedIn')?? false;

  // if(entrypoint && !isLoggedIn){
  //   defaultHome = const Login();
  // } else if(entrypoint && isLoggedIn) {
  //   defaultHome = const MainScreen();
  // }
  //

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
            ChangeNotifierProvider(create: (context) => LoginNotifier()),
            ChangeNotifierProvider(create: (context) => SignUpNotifier()),
            ChangeNotifierProvider(create: (context) => ZoomNotifier()),
            ChangeNotifierProvider(create: (context) => ChatNotifier()),
            ChangeNotifierProvider(create: (context) => ProfileNotifier()),
          ],
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Language Buddy',
          theme: AppTheme.lightTheme,
          home: defaultHome,
        );
      });
  }
}



