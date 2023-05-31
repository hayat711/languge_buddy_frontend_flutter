import 'package:flutter/material.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/constants/app_constants.dart';

import '../../constants/color_scheme.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, required this.hintText, required this.keyboardType, this.validator, this.suffixIcon, this.obscureText}) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor.withOpacity(0.8),
      child: Form(
        child: TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText?? false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            hintText: hintText,
            hintStyle: appstyle(14, contentColor.withOpacity(0.5), FontWeight.w600),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.red, width: 0.5),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.red, width: 0.5),
            ),
            disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: backgroundColor.withOpacity(0.7), width: 0.5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent, width: 0.5),
            ),
            suffixIcon: suffixIcon,
          ),
          controller: controller,
          cursorHeight: 25,
          style: appstyle(14, contentColor, FontWeight.w500),
          validator: validator,
        ),
      ),

    );
  }
}