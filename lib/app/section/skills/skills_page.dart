import 'package:flutter/material.dart';
import 'package:portfolio/app/section/about/about_desktop.dart';
import 'package:portfolio/app/section/about/about_mobile.dart';
import 'package:portfolio/app/section/about/about_tablet.dart';
import 'package:portfolio/app/section/skills/skills_desktop.dart';

import '../../../core/responsive/responsive.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AboutMobile(),
      tablet: AboutTablet(),
      desktop: SkillsDesktop(),
    );
  }
}
