import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/core/widgets/title_rich_text.dart';
import 'widget/service_info_card.dart';

class ServiceIDoDesktop extends StatelessWidget {
  const ServiceIDoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleRichText(
            titleOne: "About",
            titleTwo: "Me",
          ),
          const SizedBox(height: 20),
          Text(
            "Since the begining of my journey as a developer, I have work in these technologies.My main strength lies\nin flutter development from last one year",
            style: body1,
            textScaler: TextScaler.linear(textScaleFactor(context)),
          ),
          const SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ServiceInfoCard(
                      iconUrl: Assets.android,
                      title: 'Andorid App Development',
                      subtitle: ''),
                  ServiceInfoCard(
                      iconUrl: Assets.apple,
                      title: 'Ios App Development',
                      subtitle: '')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ServiceInfoCard(
                      iconUrl: Assets.uiux,
                      title: 'UI/UX Designing',
                      subtitle: ''),
                  ServiceInfoCard(
                      iconUrl: Assets.web,
                      title: 'Web Development',
                      subtitle: '')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
