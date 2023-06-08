import 'package:flutter/material.dart';
import 'package:language_buddy/constants/app_constants.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({ Key? key, required this.text, this.onTap, this.color, this.fontWeight, }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child: Container(
        color: accentColor,
        width: width,
        height: height * 0.08,
        child:Center(
          child: ReusableText(text: text,
          style: appstyle(24, color?? Colors.white, FontWeight.w700)
          )
        )
      )
    );
  }
}