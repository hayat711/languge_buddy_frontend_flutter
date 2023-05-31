import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({Key? key, required this.text, this.style}) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        maxLines: 1,
        softWrap: false,
        textAlign: TextAlign.left,
        overflow: TextOverflow.fade,

        style: style ?? const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
