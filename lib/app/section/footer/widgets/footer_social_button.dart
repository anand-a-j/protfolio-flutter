import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:provider/provider.dart';
import '../controller/footer_provider.dart';

class FooterSocialButtons extends StatelessWidget {
  const FooterSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 30,
      child: Center(
        child: Consumer<FooterProvider>(builder: (context, footerProvider, _) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MouseRegion(
                onEnter: (event) => footerProvider.handleHover(true, index),
                onExit: (event) => footerProvider.handleHover(false, index),
                child: GestureDetector(
                  onTap: () => openUrlLink(footerProvider.lanuchUrl[index]),
                  child: SvgPicture.asset(
                    footerProvider.socialIcon[index],
                    colorFilter: ColorFilter.mode(
                      footerProvider.isHover &&
                              footerProvider.currentIndex == index
                          ? primaryColor
                          : kwhite,
                      BlendMode.srcIn,
                    ),
                    height: 25.0,
                    width: 25.0,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: footerProvider.socialIcon.length,
          );
        }),
      ),
    );
  }
}
