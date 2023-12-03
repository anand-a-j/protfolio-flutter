import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class FormCustomButton extends StatelessWidget {
  const FormCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), gradient: buttonGradient),
        child: const Center(
          child: Text(
            "Submit",
            style: TextStyle(
              color: kwhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
