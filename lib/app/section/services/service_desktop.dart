import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';

class ServiceIDoDesktop extends StatelessWidget {
  const ServiceIDoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text(
            "What I can do?",
            style: heading2,
            textScaler: TextScaler.linear(textScaleFactor(context)),
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
                      iconUrl: AssetConstants.androidLogo,
                      title: 'Andorid App Development',
                      subtitle: ''),
                  ServiceInfoCard(
                      iconUrl: AssetConstants.appleLogo,
                      title: 'Ios App Development',
                      subtitle: '')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ServiceInfoCard(
                      iconUrl: AssetConstants.uiuxLogo,
                      title: 'UI/UX Designing',
                      subtitle: ''),
                  ServiceInfoCard(
                      iconUrl: AssetConstants.webDevelopmentLogo,
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

class ServiceInfoCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String subtitle;
  const ServiceInfoCard(
      {super.key,
      required this.iconUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Flexible(
      child: AnimatedContainer(
        margin: const EdgeInsets.all(25),
        height: width * 0.15,
        width: width * 0.25,
        transform: Matrix4.identity()..translate(0.0),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: card,
            boxShadow: boxShadow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconUrl,
              height: width * 0.035,
              width: width * 0.035,
              fit: BoxFit.contain,
            ),
            SizedBox(height: width * 0.01),
            Text(
              title,
              style: heading3,
              
            ),
            SizedBox(height: width * 0.01),
            Text(
              subtitle,
              style: body1,
            )
          ],
        ),
      ),
    );
  }
}
