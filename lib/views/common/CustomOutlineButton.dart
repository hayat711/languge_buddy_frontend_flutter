import 'package:flutter/material.dart';
import 'package:language_buddy/views/common/reusable_text.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.onTap,
    required this.color,
    required this.color2,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 200,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color2,
          border: Border.all(
            width: 1,
            color: color,
          ),
        ),
        child: Center(
          child: ReusableText(text: text),
        ),
      ),
    );
  }
}
