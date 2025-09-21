import 'package:flutter/material.dart';
import 'package:portfolio/app/section/home/widgets/home_button.dart';
import 'package:portfolio/core/constants/app_consts.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/theme/app_text_theme.dart';
import 'package:portfolio/core/utils/colors.dart';

import '../../../core/widgets/animated_gradient_text.dart';
import 'widgets/star_background.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: StarField(baseStars: 100, twinkle: true),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConsts.pWebSide,
            vertical: 50,
          ),
          child: SizedBox(
            height: height,
            width: width,
            child: Center(
              child: Column(
                spacing: AppConsts.pLarge,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(Assets.me),
                    radius: 50,
                  ),
                  Text(
                    "Hello, I'm Anand 👋",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),
                  AnimateGradientText(
                    title: "Crafting Flutter Apps.\nExploring Full-Stack.",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Flutter developer passionate about UI, performance, and app optimization.\nExpanding skills into backend, databases, and full-stack solutions.",
                      textAlign: TextAlign.center,
                      style: AppTextTheme.heroSubtitle.copyWith(
                        fontSize: 20,
                        color: onPrimaryContainerDim,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    spacing: AppConsts.pMedium,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HomeButton(
                        title: "About Me",
                        onTap: () {},
                      ),
                      HomeButton(
                        title: "Let's connect",
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
