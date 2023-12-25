import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/utils/colors.dart';

class ServiceInfoCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String subtitle;
  const ServiceInfoCard({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Flexible(
      child: AnimatedContainer(
        margin: EdgeInsets.all(width > 1024 ? 25 : 15),
        height: width > 1024 ? width * 0.15 : width * 0.5,
        width: width * 0.3,
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
              height: width > 1024 ? width * 0.035 : width * 0.1,
              width: width > 1024 ? width * 0.035 : width * 0.1,
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
