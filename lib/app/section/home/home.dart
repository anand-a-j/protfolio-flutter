import 'package:flutter/material.dart';
import 'package:portfolio/app/section/home/home_desktop.dart';
import 'package:portfolio/app/section/home/home_mobile.dart';
import 'package:portfolio/app/section/home/home_tablet.dart';
import 'package:portfolio/core/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTablet(),
      desktop: HomeDesktop(),
    );
  }
}
