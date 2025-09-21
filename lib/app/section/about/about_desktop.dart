import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_consts.dart';
import 'package:portfolio/core/constants/assets.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/title_rich_text.dart';
import '../skills/skills_desktop.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleRichText(
            titleOne: "About",
            titleTwo: "Me",
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 150,
              // vertical: AppConsts.pWebVeritical,
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 30,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryContainer,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 1,
                          color: primaryContainerBorder,
                        ),
                        image: DecorationImage(
                          image: AssetImage(Assets.aboutMe),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      """
                      I’m a Flutter developer with over 2 years of experience building cross-platform mobile apps using Dart, Firebase, and REST APIs. I specialize in crafting responsive UIs, optimizing performance, and deploying polished apps to both Google Play Store and Apple App Store.
                
                      At Armino Technologies, I worked on real-world products like diet subscription platforms and POS systems, where I improved app performance by 40%, integrated GraphQL/REST APIs, and implemented scalable state management. I also handled multi-language support, third-party SDKs, and end-to-end app releases, ensuring reliable user experiences.
                
                      Beyond Flutter, I’m continuously expanding my skills into backend and full-stack development with Node.js, Express, and databases. My goal is to deliver complete, end-to-end solutions — from clean code and smooth UIs to scalable backends that power impactful applications.  
                      """,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              ContinuousScrollPage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(-4, 0),
                    child: BlackFadeContainer(),
                  ),
                  Transform.translate(
                    offset: Offset(4, 0),
                    child: BlackFadeContainer(isLeftToRight: false),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
