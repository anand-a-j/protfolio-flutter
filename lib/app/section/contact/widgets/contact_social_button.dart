import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/utils/colors.dart';

class ContactSocialButton extends StatelessWidget {
  const ContactSocialButton({
    super.key,
    required this.image,
    this.onTap,
  });

  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primaryContainer,
          border: Border.all(
            width: 0.5,
            color: primaryContainerBorder,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              kwhite,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
