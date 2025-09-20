import 'package:flutter/material.dart';

class TitleRichText extends StatelessWidget {
  const TitleRichText({
    super.key,
    required this.titleOne,
    required this.titleTwo,
  });

  final String titleOne;
  final String titleTwo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: titleOne,
        style: TextStyle(
          fontSize: 36,
          color: Color(0xFFBABABA),
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: " $titleTwo",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
