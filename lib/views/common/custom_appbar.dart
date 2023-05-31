import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({ Key? key, this.text, this.child, this.actions}) : super(key: key);

  final String? text;
  final Widget? child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: secondaryColor,
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 30.w,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
        text: text?? '',
        style: const TextStyle(
          color: contentColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}