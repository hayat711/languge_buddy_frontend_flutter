import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            color: backgroundColor,
            child: Image.asset(
              'assets/images/page1.png',
              fit: BoxFit.cover, // Take full width and maintain aspect ratio
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  ReusableText(
                    text: 'Welcome to Language Buddy!',
                    style: appstyle(24, contentColor, FontWeight.bold),
                  ),
                  const HeightSpacer(size: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
