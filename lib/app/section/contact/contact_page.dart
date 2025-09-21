import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';

import 'widgets/contact_email_card.dart';
import 'widgets/contact_footer_text.dart';
import 'widgets/contact_social_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: width > 1024 ? 0 : 10,
      ),
      height: height / 2,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Grab a ☕ & Let's Talk",
            style: TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Feel free to reach out to me for any questions or opportunities!",
            style: body1,
            textScaler: TextScaler.linear(textScaleFactor(context)),
          ),
          SizedBox(height: width > 1024 ? 40 : 15),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10,
                children: [
                  ContactSocialButton(
                    image: Assets.github,
                    onTap: () {},
                  ),
                  // add more social icons here if needed
                  ContactSocialButton(
                    image: Assets.linkedin,
                    onTap: () {},
                  ),
                  ContactSocialButton(
                    image: Assets.twitter,
                    onTap: () {},
                  ),

                  ContactEmailCard(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
          ContactFooterText(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
