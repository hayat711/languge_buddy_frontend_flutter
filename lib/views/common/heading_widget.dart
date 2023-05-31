import 'package:flutter/material.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, this.text, this.onTap});

  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(text: text!,
            style: appstyle(20, secondaryColor, FontWeight.bold)
          ),
          GestureDetector(
            onTap: onTap,
            child: ReusableText(text: 'See all',
              style: appstyle(16, secondaryColor, FontWeight.bold)
            ),
          ),
        ],
      ),
    );
  }
}