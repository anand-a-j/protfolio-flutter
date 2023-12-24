import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'widgets/footer_copyright.dart';
import 'widgets/footer_nav_button.dart';
import 'widgets/footer_social_button.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: primaryColor.withAlpha(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),
          Text("Anand A J", style: Theme.of(context).textTheme.titleMedium,
            textScaler: TextScaler.linear(textScaleFactor(context)),
          ),
          SizedBox(height: height * 0.02),
          const FooterNavigationButtons(),
          SizedBox(height: height * 0.02),
          const FooterSocialButtons(),
          SizedBox(height: height * 0.02),
          const FooterCopyRight(),
        ],
      ),
    );
  }
}
