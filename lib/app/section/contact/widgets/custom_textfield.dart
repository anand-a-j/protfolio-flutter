
import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  const CustomTextfield({
    Key? key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hoverColor: primaryColor,
        border: OutlineInputBorder(    
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0.7,
            color: kwhite,
          ),
        ),
      ),
    );
  }
}
